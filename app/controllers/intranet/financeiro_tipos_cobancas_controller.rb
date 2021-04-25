class Intranet::FinanceiroTiposCobancasController < ApplicationController
  before_action :set_intranet_financeiro_tipos_cobanca, only: %i[ show edit update destroy ]

  # GET /intranet/financeiro_tipos_cobancas or /intranet/financeiro_tipos_cobancas.json
  def index
    @intranet_financeiro_tipos_cobancas = Intranet::FinanceiroTiposCobanca.all
  end

  # GET /intranet/financeiro_tipos_cobancas/1 or /intranet/financeiro_tipos_cobancas/1.json
  def show
  end

  # GET /intranet/financeiro_tipos_cobancas/new
  def new
    @intranet_financeiro_tipos_cobanca = Intranet::FinanceiroTiposCobanca.new
  end

  # GET /intranet/financeiro_tipos_cobancas/1/edit
  def edit
  end

  # POST /intranet/financeiro_tipos_cobancas or /intranet/financeiro_tipos_cobancas.json
  def create
    @intranet_financeiro_tipos_cobanca = Intranet::FinanceiroTiposCobanca.new(intranet_financeiro_tipos_cobanca_params)

    respond_to do |format|
      if @intranet_financeiro_tipos_cobanca.save
        format.html { redirect_to @intranet_financeiro_tipos_cobanca, notice: "Financeiro tipos cobanca was successfully created." }
        format.json { render :show, status: :created, location: @intranet_financeiro_tipos_cobanca }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @intranet_financeiro_tipos_cobanca.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /intranet/financeiro_tipos_cobancas/1 or /intranet/financeiro_tipos_cobancas/1.json
  def update
    respond_to do |format|
      if @intranet_financeiro_tipos_cobanca.update(intranet_financeiro_tipos_cobanca_params)
        format.html { redirect_to @intranet_financeiro_tipos_cobanca, notice: "Financeiro tipos cobanca was successfully updated." }
        format.json { render :show, status: :ok, location: @intranet_financeiro_tipos_cobanca }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @intranet_financeiro_tipos_cobanca.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /intranet/financeiro_tipos_cobancas/1 or /intranet/financeiro_tipos_cobancas/1.json
  def destroy
    @intranet_financeiro_tipos_cobanca.destroy
    respond_to do |format|
      format.html { redirect_to intranet_financeiro_tipos_cobancas_url, notice: "Financeiro tipos cobanca was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_intranet_financeiro_tipos_cobanca
      @intranet_financeiro_tipos_cobanca = Intranet::FinanceiroTiposCobanca.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def intranet_financeiro_tipos_cobanca_params
      params.require(:intranet_financeiro_tipos_cobanca).permit(:descricao, :tipo_valor, :sindical, :ativo)
    end
end
