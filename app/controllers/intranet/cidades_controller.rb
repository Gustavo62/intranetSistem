class Intranet::CidadesController < ApplicationController
  before_action :set_intranet_cidade, only: %i[ show edit update destroy ]
  if $user 
    before_action :authenticate_user!, :valida_acesso 
  else
    before_action :authenticate_admin!, :valida_acesso 
  end
  # GET /intranet/cidades or /intranet/cidades.json
  def index
    @intranet_cidades = Intranet::Cidade.all
  end

  # GET /intranet/cidades/1 or /intranet/cidades/1.json
  def show
  end

  # GET /intranet/cidades/new
  def new
    @intranet_cidade = Intranet::Cidade.new
  end

  # GET /intranet/cidades/1/edit
  def edit
  end

  # POST /intranet/cidades or /intranet/cidades.json
  def create
    @intranet_cidade = Intranet::Cidade.new(intranet_cidade_params)

    respond_to do |format|
      if @intranet_cidade.save
        format.html { redirect_to @intranet_cidade, notice: "Cidade was successfully created." }
        format.json { render :show, status: :created, location: @intranet_cidade }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @intranet_cidade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /intranet/cidades/1 or /intranet/cidades/1.json
  def update
    respond_to do |format|
      if @intranet_cidade.update(intranet_cidade_params)
        format.html { redirect_to @intranet_cidade, notice: "Cidade was successfully updated." }
        format.json { render :show, status: :ok, location: @intranet_cidade }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @intranet_cidade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /intranet/cidades/1 or /intranet/cidades/1.json
  def destroy
    @intranet_cidade.destroy
    respond_to do |format|
      format.html { redirect_to intranet_cidades_url, notice: "Cidade was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_intranet_cidade
      @intranet_cidade = Intranet::Cidade.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def intranet_cidade_params
      params.require(:intranet_cidade).permit(:descricao, :estado)
    end
end
