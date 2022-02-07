class Intranet::ReunionsController < ApplicationController
	before_action :valida_acesso  
  authorize_resource :class => false
  before_action :set_intranet_reunion, only: %i[ show edit update destroy ] 
  # GET /intranet/reunions or /intranet/reunions.json
  def index
    if user_signed_in?
      @intranet_reunions = Intranet::Reunion.all
      .where('intranet_cartorio_id && ARRAY[?]::integer[]' [@cart_current.id,0])
      .where(ativo: true).page(params[:page]).per(10)
    else
      @intranet_reunions = Intranet::Reunion.all.page(params[:page]).per(10)
    end
  end

  # GET /intranet/reunions/1 or /intranet/reunions/1.json
  def show
    @intranet_cartorios     = Intranet::Cartorio.where(id: @intranet_reunion.intranet_cartorio_id)
  end

  # GET /intranet/reunions/new
  def new
    @intranet_reunion       = Intranet::Reunion.new 
    @intranet_cartorios = Intranet::Cartorio.all.order(:intranet_cidade_id)
    @intranet_cartorios.each do | cart |
      @cidade = Intranet::Cidade.find(cart.intranet_cidade_id)
      if @cidade  
        cart.nome = @cidade.municipio + " - " + cart.nome
      end
    end 
    @intranet_regiaos       = Intranet::Regiao.all
    @intranet_entrancias    = Intranet::Entrancium.all
    @intranet_atividades    = Intranet::Atividade.all
    @intranet_contribuicaos = Intranet::Contribuicao.all
  end

  # GET /intranet/reunions/1/edit
  def edit
    @intranet_cartorios     = Intranet::Cartorio.all 
    
    @intranet_regiaos       = Intranet::Regiao.all
    @intranet_entrancias    = Intranet::Entrancium.all
    @intranet_atividades    = Intranet::Atividade.all
    @intranet_contribuicaos = Intranet::Contribuicao.all
  end

  def consulta_cart 
    @intranet_cartorios           = Intranet::Cartorio.all
    @intranet_cartorios_conut     = Intranet::Cartorio.all.size
    if params[:regiao].present?
      @intranet_cartorios     = @intranet_cartorios.consulta_regiao(params[:regiao])
    end
    if params[:entrancia].present?
      @intranet_cartorios     = @intranet_cartorios.consulta_entrancia(params[:entrancia])
    end
    if params[:contribuicao].present?
      @intranet_cartorios     = @intranet_cartorios.consulta_contribuicao(params[:contribuicao])
    end
    if params[:atividade].present?
      @intranet_cartorios     = @intranet_cartorios.consulta_atividade(params[:atividade])
    end 
    if @intranet_cartorios_conut == @intranet_cartorios.size
      respond_to do |format| 
        format.json { render json: nil }
      end
    else
      respond_to do |format| 
        format.json { render json: @intranet_cartorios.pluck(:id) }
      end
    end
    
  end
  # POST /intranet/reunions or /intranet/reunions.json
  def create 
    @intranet_reunion = Intranet::Reunion.new(intranet_reunion_params)

    respond_to do |format|
      if @intranet_reunion.save
        format.html { redirect_to @intranet_reunion, notice: "Reunião foi criada com sucesso." }
        format.json { render :show, status: :created, location: @intranet_reunion }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @intranet_reunion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /intranet/reunions/1 or /intranet/reunions/1.json
  def update
    respond_to do |format|
      if @intranet_reunion.update(intranet_reunion_params)
        format.html { redirect_to @intranet_reunion, notice: "Reunião foi editada com sucesso." }
        format.json { render :show, status: :ok, location: @intranet_reunion }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @intranet_reunion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /intranet/reunions/1 or /intranet/reunions/1.json
  def destroy
    @intranet_reunion.destroy
    respond_to do |format|
      format.html { redirect_to intranet_reunions_url, notice: "Reunião foi deletada com sucesso." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_intranet_reunion
      @intranet_reunion = Intranet::Reunion.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def intranet_reunion_params
      params.require(:intranet_reunion).permit(:data, :assunto, :local, :ativo, :link, intranet_cartorio_id: [])
    end
end
