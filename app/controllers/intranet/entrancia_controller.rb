class Intranet::EntranciaController < ApplicationController
	before_action :valida_acesso 
	authorize_resource :class => false
  before_action :set_intranet_entrancium, only: %i[ show edit update destroy ]

  # GET /intranet/entrancia or /intranet/entrancia.json
  def index
    @intranet_entrancia = Intranet::Entrancium.consulta_por_status(params[:status])
  end

  # GET /intranet/entrancia/1 or /intranet/entrancia/1.json
  def show
  end

  # GET /intranet/entrancia/new
  def new
    @intranet_entrancium = Intranet::Entrancium.new
  end

  # GET /intranet/entrancia/1/edit
  def edit
  end

  # POST /intranet/entrancia or /intranet/entrancia.json
  def create
    @intranet_entrancium = Intranet::Entrancium.new(intranet_entrancium_params) 
    respond_to do |format|
      if @intranet_entrancium.save
        format.html { redirect_to @intranet_entrancium, notice: "EntrânciaWb criada com sucesso." }
        format.json { render :show, status: :created, location: @intranet_entrancium }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @intranet_entrancium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /intranet/entrancia/1 or /intranet/entrancia/1.json
  def update
    respond_to do |format|
      if @intranet_entrancium.update(intranet_entrancium_params)
        format.html { redirect_to @intranet_entrancium, notice: "Entrância foi editada com sucesso." }
        format.json { render :show, status: :ok, location: @intranet_entrancium }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @intranet_entrancium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /intranet/entrancia/1 or /intranet/entrancia/1.json
  def destroy
    @intranet_entrancium.destroy
    respond_to do |format|
      format.html { redirect_to intranet_entrancia_url, notice: "Entrância foi excluida com sucesso." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_intranet_entrancium
      @intranet_entrancium = Intranet::Entrancium.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def intranet_entrancium_params 
      params.require(:intranet_entrancium).permit(:descricao, :ativo)
    end
end
