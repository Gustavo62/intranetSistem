class Intranet::ArquivosTiposController < ApplicationController
  before_action :set_intranet_arquivos_tipo, only: %i[ show edit update destroy ]

  # GET /intranet/arquivos_tipos or /intranet/arquivos_tipos.json
  def index
    @intranet_arquivos_tipos = Intranet::ArquivosTipo.all
  end

  # GET /intranet/arquivos_tipos/1 or /intranet/arquivos_tipos/1.json
  def show
  end

  # GET /intranet/arquivos_tipos/new
  def new
    @intranet_arquivos_tipo = Intranet::ArquivosTipo.new
  end

  # GET /intranet/arquivos_tipos/1/edit
  def edit
  end

  # POST /intranet/arquivos_tipos or /intranet/arquivos_tipos.json
  def create
    @intranet_arquivos_tipo = Intranet::ArquivosTipo.new(intranet_arquivos_tipo_params)

    respond_to do |format|
      if @intranet_arquivos_tipo.save
        format.html { redirect_to @intranet_arquivos_tipo, notice: "Arquivos tipo was successfully created." }
        format.json { render :show, status: :created, location: @intranet_arquivos_tipo }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @intranet_arquivos_tipo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /intranet/arquivos_tipos/1 or /intranet/arquivos_tipos/1.json
  def update
    respond_to do |format|
      if @intranet_arquivos_tipo.update(intranet_arquivos_tipo_params)
        format.html { redirect_to @intranet_arquivos_tipo, notice: "Arquivos tipo was successfully updated." }
        format.json { render :show, status: :ok, location: @intranet_arquivos_tipo }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @intranet_arquivos_tipo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /intranet/arquivos_tipos/1 or /intranet/arquivos_tipos/1.json
  def destroy
    @intranet_arquivos_tipo.destroy
    respond_to do |format|
      format.html { redirect_to intranet_arquivos_tipos_url, notice: "Arquivos tipo was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_intranet_arquivos_tipo
      @intranet_arquivos_tipo = Intranet::ArquivosTipo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def intranet_arquivos_tipo_params
      params.require(:intranet_arquivos_tipo).permit(:descricao, :ativo)
    end
end
