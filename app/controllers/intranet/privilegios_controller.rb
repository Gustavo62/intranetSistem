class Intranet::PrivilegiosController < ApplicationController
	before_action :valida_acesso  
  authorize_resource :class => false
  before_action :set_intranet_privilegio, only: %i[ show edit update destroy ]
  # GET /intranet/privilegios or /intranet/privilegios.json
  def index
    @intranet_privilegios = Intranet::Privilegio.consulta_por_status(params[:status])
  end

  # GET /intranet/privilegios/1 or /intranet/privilegios/1.json
  def show
  end

  # GET /intranet/privilegios/new
  def new
    @intranet_privilegio = Intranet::Privilegio.new
  end

  # GET /intranet/privilegios/1/edit
  def edit
  end

  # POST /intranet/privilegios or /intranet/privilegios.json
  def create
    @intranet_privilegio = Intranet::Privilegio.new(intranet_privilegio_params)
    
    respond_to do |format|
      if @intranet_privilegio.save
        format.html { redirect_to @intranet_privilegio, notice: "Privilégio criada com sucesso." }
        format.json { render :show, status: :created, location: @intranet_privilegio }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @intranet_privilegio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /intranet/privilegios/1 or /intranet/privilegios/1.json
  def update
    respond_to do |format|
      if @intranet_privilegio.update(intranet_privilegio_params)
        format.html { redirect_to @intranet_privilegio, notice: "Privilégio foi editada com sucesso." }
        format.json { render :show, status: :ok, location: @intranet_privilegio }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @intranet_privilegio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /intranet/privilegios/1 or /intranet/privilegios/1.json
  def destroy
    @intranet_privilegio.destroy
    respond_to do |format|
      format.html { redirect_to intranet_privilegios_url, notice: "Privilégio foi excluida com sucesso." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_intranet_privilegio
      @intranet_privilegio = Intranet::Privilegio.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def intranet_privilegio_params
      params.require(:intranet_privilegio).permit(:descricao, :ativo)
    end
end
