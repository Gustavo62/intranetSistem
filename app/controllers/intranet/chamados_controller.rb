class Intranet::ChamadosController < ApplicationController
	before_action :valida_acesso 
	authorize_resource :class => false
  before_action :set_intranet_chamado, only: %i[ show edit update destroy ]

  # GET /intranet/chamados or /intranet/chamados.json
  def index
    @intranet_chamados = Intranet::Chamado.all
  end

  # GET /intranet/chamados/1 or /intranet/chamados/1.json
  def show
  end

  # GET /intranet/chamados/new
  def new
    @intranet_chamado = Intranet::Chamado.new
  end

  # GET /intranet/chamados/1/edit
  def edit
  end

  # POST /intranet/chamados or /intranet/chamados.json
  def create
    @intranet_chamado = Intranet::Chamado.new(intranet_chamado_params)

    respond_to do |format|
      if @intranet_chamado.save
        format.html { redirect_to @intranet_chamado, notice: "Chamado foi criado com sucesso." }
        format.json { render :show, status: :created, location: @intranet_chamado }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @intranet_chamado.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /intranet/chamados/1 or /intranet/chamados/1.json
  def update
    respond_to do |format|
      if @intranet_chamado.update(intranet_chamado_params)
        format.html { redirect_to @intranet_chamado, notice: "Chamado foi atualizado com sucesso." }
        format.json { render :show, status: :ok, location: @intranet_chamado }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @intranet_chamado.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /intranet/chamados/1 or /intranet/chamados/1.json
  def destroy
    @intranet_chamado.destroy
    respond_to do |format|
      format.html { redirect_to intranet_chamados_url, notice: "Chamado foi deletado com sucesso." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_intranet_chamado
      @intranet_chamado = Intranet::Chamado.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def intranet_chamado_params
      params.require(:intranet_chamado).permit(:assunto, :intranet_associado_id, :mensagem_pergunta, :mensagem_resposta, :profissional_id, :visualizada, :visualizada_at)
    end
end
