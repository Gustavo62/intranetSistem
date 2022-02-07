class Intranet::MalaDiretaController < ApplicationController
	before_action :valida_acesso  
  authorize_resource :class => false
  before_action :set_intranet_mala_diretum, only: %i[ show edit update destroy ]

  # GET /intranet/mala_direta or /intranet/mala_direta.json
  def index
    @intranet_mala_direta = Intranet::MalaDiretum.all.page(params[:page]).per(10)
  end

  # GET /intranet/mala_direta/1 or /intranet/mala_direta/1.json
  def show
    @intranet_cartorios     = Intranet::Cartorio.all
  end

  # GET /intranet/mala_direta/new
  def new
    @intranet_mala_diretum = Intranet::MalaDiretum.new 
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

  # GET /intranet/mala_direta/1/edit
  def edit
  end

  # POST /intranet/mala_direta or /intranet/mala_direta.json
  def create
    @intranet_mala_diretum = Intranet::MalaDiretum.new(intranet_mala_diretum_params.merge(layout: params[:intranet_mala_diretum_layout]))

    respond_to do |format|
      if @intranet_mala_diretum.save 
				Intranet::MalaDireta::DispararMalaDiretaJob.perform_later(@intranet_mala_diretum.id)
        format.html { redirect_to @intranet_mala_diretum, notice: "Mala direta foi criada com sucesso." }
        format.json { render :show, status: :created, location: @intranet_mala_diretum }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @intranet_mala_diretum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /intranet/mala_direta/1 or /intranet/mala_direta/1.json
  def update
    respond_to do |format|
      if @intranet_mala_diretum.update(intranet_mala_diretum_params.merge(layout: params[:intranet_mala_diretum_layout]))
        format.html { redirect_to @intranet_mala_diretum, notice: "Mala direta foi atualizada com sucesso." }
        format.json { render :show, status: :ok, location: @intranet_mala_diretum }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @intranet_mala_diretum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /intranet/mala_direta/1 or /intranet/mala_direta/1.json
  def destroy
    @intranet_mala_diretum.destroy
    respond_to do |format|
      format.html { redirect_to intranet_mala_direta_url, notice: "Mala direta foi deletado com sucesso." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_intranet_mala_diretum
      @intranet_mala_diretum = Intranet::MalaDiretum.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def intranet_mala_diretum_params
      params.require(:intranet_mala_diretum).permit(:assunto,:sub_assunto,:layout, :email,:intranet_cartorio_id => [])
    end
end
