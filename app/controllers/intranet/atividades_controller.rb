class Intranet::AtividadesController < ApplicationController
	before_action :valida_acesso
  before_action :set_intranet_atividade, only: %i[ show edit update destroy ]
  authorize_resource :class => false
  # GET /intranet/atividades or /intranet/atividades.json
  def index
    @intranet_atividades = Intranet::Atividade.consulta_por_status(params[:status])
  end

  # GET /intranet/atividades/1 or /intranet/atividades/1.json
  def show
  end

  # GET /intranet/atividades/new
  def new
    @intranet_atividade = Intranet::Atividade.new
  end

  # GET /intranet/atividades/1/edit
  def edit
  end

  # POST /intranet/atividades or /intranet/atividades.json
  def create
    @intranet_atividade = Intranet::Atividade.new(intranet_atividade_params) 
    
    respond_to do |format|
      if @intranet_atividade.save
        format.html { redirect_to @intranet_atividade, notice: "Atividade criada com sucesso." }
        format.json { render :show, status: :created, location: @intranet_atividade }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @intranet_atividade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /intranet/atividades/1 or /intranet/atividades/1.json
  def update
    respond_to do |format|
      if @intranet_atividade.update(intranet_atividade_params)
        format.html { redirect_to @intranet_atividade, notice: "Atividade foi editada com sucesso." }
        format.json { render :show, status: :ok, location: @intranet_atividade }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @intranet_atividade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /intranet/atividades/1 or /intranet/atividades/1.json
  def destroy
    @intranet_atividade.destroy
    respond_to do |format|
      format.html { redirect_to intranet_atividades_url, notice: "Atividade foi excluida com sucesso." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_intranet_atividade
      @intranet_atividade = Intranet::Atividade.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def intranet_atividade_params
      params.require(:intranet_atividade).permit(:descricao, :ativo)
    end
end
