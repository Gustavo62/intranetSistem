class Intranet::AvisosController < ApplicationController
  before_action :set_intranet_aviso, only: %i[ show edit update destroy ]
  if $user 
    before_action :authenticate_user!, :valida_acesso 
  else
    before_action :authenticate_admin!, :valida_acesso 
  end
  # GET /intranet/avisos or /intranet/avisos.json
  def index
    @intranet_avisos = Intranet::Aviso.all
    @atividades = Intranet::Atividade.all
  end

  # GET /intranet/avisos/1 or /intranet/avisos/1.json
  def show
    @atividades = Intranet::Atividade.all
  end

  # GET /intranet/avisos/new
  def new
    @intranet_aviso = Intranet::Aviso.new
    @atividades = Intranet::Atividade.where(ativo: true)
  end

  # GET /intranet/avisos/1/edit
  def edit
  end

  # POST /intranet/avisos or /intranet/avisos.json
  def create
    @intranet_aviso = Intranet::Aviso.new(intranet_aviso_params)

    respond_to do |format|
      if @intranet_aviso.save
        format.html { redirect_to @intranet_aviso, notice: "Aviso was successfully created." }
        format.json { render :show, status: :created, location: @intranet_aviso }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @intranet_aviso.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /intranet/avisos/1 or /intranet/avisos/1.json
  def update
    respond_to do |format|
      if @intranet_aviso.update(intranet_aviso_params)
        format.html { redirect_to @intranet_aviso, notice: "Aviso was successfully updated." }
        format.json { render :show, status: :ok, location: @intranet_aviso }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @intranet_aviso.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /intranet/avisos/1 or /intranet/avisos/1.json
  def destroy
    @intranet_aviso.destroy
    respond_to do |format|
      format.html { redirect_to intranet_avisos_url, notice: "Aviso was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_intranet_aviso
      @intranet_aviso = Intranet::Aviso.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def intranet_aviso_params
      params.require(:intranet_aviso).permit(:descricao, :atividade_id, :ativo)
    end 
end
