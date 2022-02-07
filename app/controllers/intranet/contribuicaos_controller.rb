class Intranet::ContribuicaosController < ApplicationController
  before_action :valida_acesso 
	authorize_resource :class => false
  before_action :set_intranet_contribuicao, only: %i[ show edit update destroy ]
  # GET /intranet/contribuicaos or /intranet/contribuicaos.json
  def index
    @intranet_contribuicaos = Intranet::Contribuicao.consulta_por_status(params[:status])
  end

  # GET /intranet/contribuicaos/1 or /intranet/contribuicaos/1.json
  def show
  end

  # GET /intranet/contribuicaos/new
  def new
    @intranet_contribuicao = Intranet::Contribuicao.new
  end

  # GET /intranet/contribuicaos/1/edit
  def edit
  end

  # POST /intranet/contribuicaos or /intranet/contribuicaos.json
  def create
    @intranet_contribuicao = Intranet::Contribuicao.new(intranet_contribuicao_params) 
    respond_to do |format|
      if @intranet_contribuicao.save
        format.html { redirect_to @intranet_contribuicao, notice: "Contribuição criado com sucesso." }
        format.json { render :show, status: :created, location: @intranet_contribuicao }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @intranet_contribuicao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /intranet/contribuicaos/1 or /intranet/contribuicaos/1.json
  def update
    respond_to do |format|
      if @intranet_contribuicao.update(intranet_contribuicao_params)
        format.html { redirect_to @intranet_contribuicao, notice: "Contribuição foi editado com sucesso." }
        format.json { render :show, status: :ok, location: @intranet_contribuicao }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @intranet_contribuicao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /intranet/contribuicaos/1 or /intranet/contribuicaos/1.json
  def destroy
    @intranet_contribuicao.destroy
    respond_to do |format|
      format.html { redirect_to intranet_contribuicaos_url, notice: "Contribuição foi excluido com sucesso." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_intranet_contribuicao
      @intranet_contribuicao = Intranet::Contribuicao.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def intranet_contribuicao_params
      params.require(:intranet_contribuicao).permit(:descricao, :ativo,:valor_base)
    end
end
