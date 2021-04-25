class Intranet::AssociadosController < ApplicationController
  before_action :set_intranet_associado, only: %i[ show edit update destroy ]

  # GET /intranet/associados or /intranet/associados.json
  def index
    @intranet_associados = Intranet::Associado.all
  end

  # GET /intranet/associados/1 or /intranet/associados/1.json
  def show
  end

  # GET /intranet/associados/new
  def new
    @intranet_associado = Intranet::Associado.new
  end

  # GET /intranet/associados/1/edit
  def edit
  end

  # POST /intranet/associados or /intranet/associados.json
  def create
    @intranet_associado = Intranet::Associado.new(intranet_associado_params)

    respond_to do |format|
      if @intranet_associado.save
        format.html { redirect_to @intranet_associado, notice: "Associado was successfully created." }
        format.json { render :show, status: :created, location: @intranet_associado }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @intranet_associado.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /intranet/associados/1 or /intranet/associados/1.json
  def update
    respond_to do |format|
      if @intranet_associado.update(intranet_associado_params)
        format.html { redirect_to @intranet_associado, notice: "Associado was successfully updated." }
        format.json { render :show, status: :ok, location: @intranet_associado }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @intranet_associado.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /intranet/associados/1 or /intranet/associados/1.json
  def destroy
    @intranet_associado.destroy
    respond_to do |format|
      format.html { redirect_to intranet_associados_url, notice: "Associado was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_intranet_associado
      @intranet_associado = Intranet::Associado.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def intranet_associado_params 
      params.require(:user).permit(intranet_associado_attributes: [:user_id, :cidade_id, :matricula, :data_nascimento, :funcao, :rg, :sexo, :ativo, :cep, :logradouro, :complemento, :bairro, :telefone_1, :telefone_2, :celular, :whatsapp, :email])
    end
end
