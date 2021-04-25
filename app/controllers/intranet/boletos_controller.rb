class Intranet::BoletosController < ApplicationController
  before_action :set_intranet_boleto, only: %i[ show edit update destroy ]

  # GET /intranet/boletos or /intranet/boletos.json
  def index
    @intranet_boletos = Intranet::Boleto.all
  end

  # GET /intranet/boletos/1 or /intranet/boletos/1.json
  def show
  end

  # GET /intranet/boletos/new
  def new
    @intranet_boleto = Intranet::Boleto.new
  end

  # GET /intranet/boletos/1/edit
  def edit
  end

  # POST /intranet/boletos or /intranet/boletos.json
  def create
    @intranet_boleto = Intranet::Boleto.new(intranet_boleto_params)

    respond_to do |format|
      if @intranet_boleto.save
        format.html { redirect_to @intranet_boleto, notice: "Boleto was successfully created." }
        format.json { render :show, status: :created, location: @intranet_boleto }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @intranet_boleto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /intranet/boletos/1 or /intranet/boletos/1.json
  def update
    respond_to do |format|
      if @intranet_boleto.update(intranet_boleto_params)
        format.html { redirect_to @intranet_boleto, notice: "Boleto was successfully updated." }
        format.json { render :show, status: :ok, location: @intranet_boleto }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @intranet_boleto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /intranet/boletos/1 or /intranet/boletos/1.json
  def destroy
    @intranet_boleto.destroy
    respond_to do |format|
      format.html { redirect_to intranet_boletos_url, notice: "Boleto was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_intranet_boleto
      @intranet_boleto = Intranet::Boleto.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def intranet_boleto_params
      params.require(:intranet_boleto).permit(:intranet_financeiro_tipos_cobranca_id, :intranet_financeiro_portadores, :intranet_regiao_id, :intranet_entrancias_id, :intranet_contribuicao_id, :intranet_atividade, :intranet_cartorio_id, :valor, :vencimento, :descricao, :observacao_email, :forma_cobranca, :apenas_titular)
    end
end
