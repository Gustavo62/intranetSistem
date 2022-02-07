class Intranet::ContribuicaoImportadasController < ApplicationController
	before_action :valida_acesso 
	authorize_resource :class => false
  before_action :set_intranet_contribuicao_importada, only: %i[ show edit update destroy ]

  # GET /intranet/contribuicao_importadas or /intranet/contribuicao_importadas.json
  def index
    @intranet_contribuicao_importadas = Intranet::ContribuicaoImportada.all
  end

  # GET /intranet/contribuicao_importadas/1 or /intranet/contribuicao_importadas/1.json
  def show
  end

  # GET /intranet/contribuicao_importadas/new
  def new
    @intranet_contribuicao_importada = Intranet::ContribuicaoImportada.new
  end

  # GET /intranet/contribuicao_importadas/1/edit
  def edit
  end

  # POST /intranet/contribuicao_importadas or /intranet/contribuicao_importadas.json
  def create
    @intranet_contribuicao_importada = Intranet::ContribuicaoImportada.new(intranet_contribuicao_importada_params)

    respond_to do |format|
      if @intranet_contribuicao_importada.save
        format.html { redirect_to @intranet_contribuicao_importada, notice: "Contribuicao importada foi criada com sucesso." }
        format.json { render :show, status: :created, location: @intranet_contribuicao_importada }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @intranet_contribuicao_importada.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /intranet/contribuicao_importadas/1 or /intranet/contribuicao_importadas/1.json
  def update
    respond_to do |format|
      if @intranet_contribuicao_importada.update(intranet_contribuicao_importada_params)
        format.html { redirect_to @intranet_contribuicao_importada, notice: "Contribuicao importada foi atualizada com sucesso." }
        format.json { render :show, status: :ok, location: @intranet_contribuicao_importada }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @intranet_contribuicao_importada.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /intranet/contribuicao_importadas/1 or /intranet/contribuicao_importadas/1.json
  def destroy
    @intranet_contribuicao_importada.destroy
    respond_to do |format|
      format.html { redirect_to intranet_contribuicao_importadas_url, notice: "Contribuicao importada foi deletado com sucesso." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_intranet_contribuicao_importada
      @intranet_contribuicao_importada = Intranet::ContribuicaoImportada.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def intranet_contribuicao_importada_params
      params.require(:intranet_contribuicao_importada).permit(:ano, :documento)
    end
end
