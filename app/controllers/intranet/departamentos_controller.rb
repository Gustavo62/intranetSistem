class Intranet::DepartamentosController < ApplicationController
  before_action :set_intranet_departamento, only: %i[ show edit update destroy ]
  if $user 
    before_action :authenticate_user!, :valida_acesso 
  else
    before_action :authenticate_admin!, :valida_acesso 
  end
  # GET /intranet/departamentos or /intranet/departamentos.json
  def index
    @intranet_departamentos = Intranet::Departamento.all
  end

  # GET /intranet/departamentos/1 or /intranet/departamentos/1.json
  def show
  end

  # GET /intranet/departamentos/new
  def new
    @intranet_departamento = Intranet::Departamento.new
  end

  # GET /intranet/departamentos/1/edit
  def edit
  end

  # POST /intranet/departamentos or /intranet/departamentos.json
  def create
    @intranet_departamento = Intranet::Departamento.new(intranet_departamento_params)

    respond_to do |format|
      if @intranet_departamento.save
        format.html { redirect_to @intranet_departamento, notice: "Departamento was successfully created." }
        format.json { render :show, status: :created, location: @intranet_departamento }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @intranet_departamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /intranet/departamentos/1 or /intranet/departamentos/1.json
  def update
    respond_to do |format|
      if @intranet_departamento.update(intranet_departamento_params)
        format.html { redirect_to @intranet_departamento, notice: "Departamento was successfully updated." }
        format.json { render :show, status: :ok, location: @intranet_departamento }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @intranet_departamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /intranet/departamentos/1 or /intranet/departamentos/1.json
  def destroy
    @intranet_departamento.destroy
    respond_to do |format|
      format.html { redirect_to intranet_departamentos_url, notice: "Departamento was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_intranet_departamento
      @intranet_departamento = Intranet::Departamento.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def intranet_departamento_params
      params.require(:intranet_departamento).permit(:descricao, :ativo)
    end
end
