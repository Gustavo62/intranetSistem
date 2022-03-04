class Intranet::BoletosController < ApplicationController
	before_action :valida_acesso  
  before_action :set_intranet_boleto, only: %i[ show edit update destroy gerarBolteto ] 
  authorize_resource :class => false
  
  def index
    if user_signed_in?
      @cartorio = Intranet::Cartorio.pesquisa_cart_id(current_user.aux_cartorio_id).take 
      @associados_aux  = Intranet::Associado.where('intranet_cartorio && ARRAY[?]::integer[]' [@cartorio.id]) 
      @associados  = Intranet::Associado.where('intranet_cartorio && ARRAY[?]::integer[]' [@cartorio.id]).pesquisa_assoc_id(params[:associado])
      @intranet_boletos = Intranet::Boleto.where(intranet_associado_id: @dados_assoc.id).pesquisa_bolet(params[:status]).page(params[:page]).per(10)
      @intranet_boletos_aux = Intranet::Boleto.where(intranet_associado_id: @dados_assoc.id)
      @intranet_cartorios_consult = Intranet::Cartorio.all
      @intranet_cidades_consult   = Intranet::Cidade.all
    else
      @cartorio = Intranet::Cartorio.pesquisa_cart_id(params[:id_cart]) 
      @associados_aux  = Intranet::Associado.where('intranet_cartorio && ARRAY[?]::integer[]' [@cartorio.ids.to_s])
      @associados  = Intranet::Associado.where('intranet_cartorio && ARRAY[?]::integer[]' [@cartorio.ids.to_s]).pesquisa_assoc_id(params[:associado])
      @intranet_boletos = Intranet::Boleto.where(intranet_associado_id: @associados.ids).pesquisa_bolet(params[:status]).page(params[:page]).per(10)
      @intranet_boletos_aux = Intranet::Boleto.where(intranet_associado_id: @associados.ids)
      @intranet_cartorios_consult = Intranet::Cartorio.all.order(:intranet_cidade_id)
      @intranet_cartorios_consult.each do | cart |
        @cidade = Intranet::Cidade.find(cart.intranet_cidade_id)
        if @cidade  
          cart.nome = @cidade.municipio + " - " + cart.nome
        end
      end 
      @intranet_cidades_consult   = Intranet::Cidade.all
    end
  end 
  def show
    @user = User.find_by_id(Intranet::Associado.find_by_id(@intranet_boleto.intranet_associado_id).try(:user_id)) 
    @intranet_boleto.status =  I18n.t("boleto_simples.status.#{@intranet_boleto.status}") 
  end
 
  def new
    @intranet_boleto    = Intranet::Boleto.new 
    @associados =  Intranet::Associado.where(intranet_cartorio: Intranet::Cartorio.all.ids)
    @intranet_cartorios = Intranet::Cartorio.where.not(intranet_associado_id: nil).order(:intranet_cidade_id)
    @intranet_cartorios.each do | cart |
      @cidade = Intranet::Cidade.find(cart.intranet_cidade_id)
      if @cidade  
        cart.nome = @cidade.municipio + " - " + cart.nome
      end
    end 
  end
 
  def atualizaAssociados 
    @associados         = Intranet::Associado.where("intranet_cartorio @> ?", "{#{params[:cart_id]}}") 
    respond_to do |format| 
      format.json { render json: @associados.pluck(:id,:nome) }
    end 
  end

  def edit
    @associados =  Intranet::Associado.where(intranet_cartorio_id: Intranet::Cartorio.ids)
    @intranet_cartorios = Intranet::Cartorio.where(id: @associados.pluck(:intranet_cartorio_id)).order(:intranet_cidade_id)
    @intranet_cartorios.each do | cart |
      @cidade = Intranet::Cidade.find(cart.intranet_cidade_id)
      if @cidade  
        cart.nome = @cidade.municipio + " - " + cart.nome
      end
    end 
  end 

  def create 
    @id_cart   = params[:intranet_boleto][:intranet_cartorio_id]
    @associado = Intranet::Associado.all.where(ativo: true).where("intranet_cartorio @> ?", "{#{params[:intranet_boleto][:intranet_cartorio_id]}}").take
    @intranet_boleto    = Intranet::Boleto.new(intranet_boleto_params.merge(intranet_associado_id: @associado.id,metodo:'avulso'))
    respond_to do |format|
      if @intranet_boleto.save
        Intranet::Boleto.createBoleto(@intranet_boleto,@id_cart)
        format.html { redirect_to @intranet_boleto, notice: "Boleto criado com sucesso." }
        format.json { render :show, status: :created, location: @intranet_boleto }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @intranet_boleto.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def update
    respond_to do |format|
      if @intranet_boleto.update(intranet_boleto_params)
        format.html { redirect_to @intranet_boleto, notice: "Boleto atualizado com sucesso." }
        format.json { render :show, status: :ok, location: @intranet_boleto }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @intranet_boleto.errors, status: :unprocessable_entity }
      end
    end
  end
 
  def destroy
    @intranet_boleto.destroy
    respond_to do |format|
      format.html { redirect_to intranet_boletos_url, notice: "Boleto foi deletado com sucesso." }
      format.json { head :no_content }
    end
  end

  private 
    def set_intranet_boleto
      @intranet_boleto = Intranet::Boleto.find(params[:id])
    end
 
    def intranet_boleto_params
      params.require(:intranet_boleto).permit(:intranet_associado_id,:valor,:vencimento,:tipo,:metodo,:descricao,:nosso_numero,:estornado,:a_maior)
    end
end   