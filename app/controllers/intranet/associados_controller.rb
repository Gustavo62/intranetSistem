class Intranet::AssociadosController < ApplicationController
	before_action :valida_acesso
  before_action :set_intranet_associado, only: %i[ show edit update destroy acesso ] 
	authorize_resource :class => false
	require './lib/generate_pdf'
  # GET /intranet/associados or /intranet/associados.json
  def index
    @intranet_associados_ids = []
    @intranet_associados        = Intranet::Associado.pesquisa_assoc(params[:acesso])
    @intranet_associados.pluck(:intranet_cartorio).each do | assoc_id |
      if(assoc_id.size != 0)
        assoc_id.each do | id |
          @intranet_associados_ids << id
        end
      else
        @intranet_associados_ids << assoc_id
      end
    end
    @intranet_associados_ids    = @intranet_associados_ids.uniq 
    @intranet_cartorios         = Intranet::Cartorio.all.order(:intranet_cidade_id).pesquisa_cart_serv(params[:intranet_cartorio_id]).where(id: @intranet_associados_ids).pesquisa_situacao_adimp(params[:situacao])
    @intranet_cartorios_aux     = Intranet::Cartorio.all.order(:intranet_cidade_id).pesquisa_cart_serv(params[:intranet_cartorio_id]).where(id: @intranet_associados_ids).pesquisa_situacao_adimp(params[:situacao])
    @cidades                    = Intranet::Cidade.pesquisa_cidade(params[:cidade]).where(id: @intranet_cartorios.pluck(:intranet_cidade_id)).page(params[:page]).per(10) 
    @intranet_cartorios_consult = Intranet::Cartorio.all.order(:intranet_cidade_id)
    @intranet_cartorios_consult.each do | cart |
      @cidade = Intranet::Cidade.find(cart.intranet_cidade_id)
      if @cidade  
        cart.nome = @cidade.municipio + " - " + cart.nome
      end
    end 
    @intranet_cidades_consult   = Intranet::Cidade.all
    @ids_total                  = [] 
    @filtro                     = valida_filtros(params[:intranet_cartorio_id],params[:cidade],params[:acesso],params[:situacao]) 
    @user_new                   = User.new
  end

  def valida_filtros(intranet_cartorio_id,cidade,acesso,situacao)
    filtro = []
    filtro << "Cartório - #{Intranet::Cartorio.where(id: intranet_cartorio_id).take.try(:nome)}" if intranet_cartorio_id != ""
    filtro << "Cidade - #{Intranet::Cidade.find_by_id(cidade).try(:municipio)}" if cidade != ""
    filtro << "Acesso - Liberado" if acesso == '0'
    filtro << "Acesso - Bloqueado" if acesso == '1'
    filtro << "Situação - Adiplente" if situacao == '0'
    filtro << "Situação - Inadimplente" if situacao == '1'
    return filtro.join(", ")
  end 
  def logar_como      
    sign_out(current_admin) 
    user = User.find(params[:user_id])
    sign_in(user)  
    redirect_to root_path 
  end
  # GET /intranet/associados/1 or /intranet/associados/1.json
  def acesso
    if @intranet_associado.ativo
      @intranet_associado.ativo = false
    else 
      @intranet_associado.ativo = true
    end 
    @intranet_associado.save
    redirect_to intranet_associados_url
  end
  def relatorio 
    GeneratePdf::relatorio_simples(params[:ref_ids],current_admin.nome,params[:filtro])
    redirect_to "/relatorio_simples.pdf"  
  end
  def show
    @user         = User.find_by_id(@intranet_associado.user_id)
    @boletos      = Intranet::Boleto.where(intranet_associado_id: @intranet_associado.id) 
    @situacaoFixa = Intranet::FixaFiliacao.verificaFicha(@user.id)
    @termoPosse   = Intranet::TermoPosse.termoPosse(@user.id)
  end

  # GET /intranet/associados/new
  def new
    @intranet_associado = Intranet::Associado.new
    @cartorios = Intranet::Cartorio.all.order(:intranet_cidade_id)
    @cartorios.each do | cart |
      @cidade = Intranet::Cidade.find(cart.intranet_cidade_id)
      if @cidade  
        cart.nome = @cidade.municipio + " - " + cart.nome
      end
    end 
  end 
  # GET /intranet/associados/1/edit
  def edit
    @user = User.find_by_id(@intranet_associado.user_id)
    @cartorios = Intranet::Cartorio.all.order(:intranet_cidade_id)
    @cartorios.each do | cart |
      @cidade = Intranet::Cidade.find(cart.intranet_cidade_id)
      if @cidade  
        cart.nome = @cidade.municipio + " - " + cart.nome
      end
    end 
  end

  # POST /intranet/associados or /intranet/associados.json
  def create 
    @intranet_associado = Intranet::Associado.new(intranet_associado_params) 
    respond_to do |format|
      if @intranet_associado.save
        format.html { redirect_to @intranet_associado, notice: "Associado foi criado com sucesso." }
        format.json { render :show, status: :created, location: @intranet_associado }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @intranet_associado.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /intranet/associados/1 or /intranet/associados/1.json
  def update
    #.reject!(&:empty?)
    params[:intranet_associado][:intranet_cartorio] = params[:intranet_associado][:intranet_cartorio]
    @user = User.find(@intranet_associado.user_id)
    respond_to do |format|
      if @intranet_associado.update(intranet_associado_params)
        @intranet_associado.intranet_cartorio.each do | cart_id |  
          if params[:intranet_associado][:"termo_posse_#{cart_id}"] 
            @termo    = Intranet::TermoPosse.where(ativo: true,user_id: @user.id, intranet_associado_id: @intranet_associado.id, intranet_cartorio_id: cart_id).take
            if @termo
              @termo.termo_posse.attach(params[:intranet_associado][:"termo_posse_#{cart_id}"])
            else
              @termo = Intranet::TermoPosse.create(ativo: true,user_id: @user.id, intranet_associado_id: @intranet_associado.id, intranet_cartorio_id: cart_id) 
              @termo.termo_posse.attach(params[:intranet_associado][:"termo_posse_#{cart_id}"])
            end
          end
        end 
        format.html { redirect_to @intranet_associado, notice: "Associado foi atualizado com sucesso." }
        format.json { render :show, status: :ok, location: @intranet_associado }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @intranet_associado.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /intranet/associados/1 or /intranet/associados/1.json
  def destroy 
    User.find_by_id(@intranet_associado.user_id).destroy 
    respond_to do |format|
      format.html { redirect_to intranet_associados_url, notice: "Associado foi deletado." }
      format.json { head :no_content }
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_intranet_associado
      @intranet_associado = Intranet::Associado.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def intranet_associado_params 
      params.require(:intranet_associado).permit(:substituto,:user_id, :cidade_id, :matricula, :data_nascimento, :funcao, :rg, :sexo, :ativo, :cep, :logradouro, :complemento, :bairro, :telefone_1, :telefone_2, :celular, :whatsapp, :email,:intranet_cartorio => [])
    end
end