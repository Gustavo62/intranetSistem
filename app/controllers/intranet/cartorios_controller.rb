class Intranet::CartoriosController < ApplicationController
	before_action :valida_acesso 
	authorize_resource :class => false
  before_action :set_intranet_cartorio, only: %i[ show edit update destroy ]

  # GET /intranet/cartorios or /intranet/cartorios.json
  def index 
    @intranet_cidades   = Intranet::Cidade.all
    @intranet_cartorios = Intranet::Cartorio.pesquisa_cart_status(params[:status]).pesquisa_cart_cidade_id(params[:cidade]).order(:intranet_cidade_id).page(params[:page]).per(10)
		@intranet_cartorios.each do |cart|
			@cidade = @intranet_cidades.find_by_id(cart.intranet_cidade_id)
			cart.nome = "#{@cidade.municipio} - #{cart.nome}"
		end 
  end

  # GET /intranet/cartorios/1 or /intranet/cartorios/1.json
  def show
    @intranet_regiaos       = Intranet::Regiao.all
    @intranet_cidades       = Intranet::Cidade.all
    @intranet_entrancias    = Intranet::Entrancium.all 
    @intranet_contribuicaos = Intranet::Contribuicao.all
    
    @associado              = Intranet::Associado.where("intranet_cartorio @> ?", "{#{@intranet_cartorio.id}}").take
  end

  # GET /intranet/cartorios/new
  def new
    @intranet_cartorio = Intranet::Cartorio.new

    @intranet_regiaos       = Intranet::Regiao.all
    @intranet_cidades       = Intranet::Cidade.all
    @intranet_entrancias    = Intranet::Entrancium.all 
    @intranet_contribuicaos = Intranet::Contribuicao.all
  end

  # GET /intranet/cartorios/1/edit
  def edit 
    @intranet_cidades       = Intranet::Cidade.all
    @intranet_regiaos       = Intranet::Regiao.all
    @intranet_entrancias    = Intranet::Entrancium.all 
    @intranet_contribuicaos = Intranet::Contribuicao.all
  end

  # POST /intranet/cartorios or /intranet/cartorios.json
  def create
    @intranet_cartorio = Intranet::Cartorio.new(intranet_cartorio_params)

    respond_to do |format|
      if @intranet_cartorio.save
        format.html { redirect_to @intranet_cartorio, notice: "Cartorio foi criado com sucesso." }
        format.json { render :show, status: :created, location: @intranet_cartorio }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @intranet_cartorio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /intranet/cartorios/1 or /intranet/cartorios/1.json
  def update
    respond_to do |format|
      if @intranet_cartorio.update(intranet_cartorio_params)
        format.html { redirect_to @intranet_cartorio, notice: "Cartorio foi atualizado com sucesso." }
        format.json { render :show, status: :ok, location: @intranet_cartorio }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @intranet_cartorio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /intranet/cartorios/1 or /intranet/cartorios/1.json
  def destroy
    @intranet_cartorio.destroy
    respond_to do |format|
      format.html { redirect_to intranet_cartorios_url, notice: "Cartorio foi deletado com sucesso." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_intranet_cartorio
      @intranet_cartorio = Intranet::Cartorio.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def intranet_cartorio_params
      params.require(:intranet_cartorio).permit(:ativo,:possui_cnpj, :cei, :cnpj, :cod_tj, :cod_cnj, :nome, :nome_fant, :nome_res, :cep, :logradouro, :numero, :bairro, :complemento, :telefone_fixo, :telefone_celular, :whatsapp, :email, :forma_branca, :observacao, :intranet_regiao_id, :intranet_contribuicao_id, :intranet_entrancia_id, :intranet_cidade_id)
    end
end
