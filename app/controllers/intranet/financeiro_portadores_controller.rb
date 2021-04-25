class Intranet::FinanceiroPortadoresController < ApplicationController
  before_action :set_intranet_financeiro_portadore, only: %i[ show edit update destroy ]

  # GET /intranet/financeiro_portadores or /intranet/financeiro_portadores.json
  def index
    @intranet_financeiro_portadores = Intranet::FinanceiroPortadore.all
  end

  # GET /intranet/financeiro_portadores/1 or /intranet/financeiro_portadores/1.json
  def show
  end

  # GET /intranet/financeiro_portadores/new
  def new
    @intranet_financeiro_portadore = Intranet::FinanceiroPortadore.new
  end

  # GET /intranet/financeiro_portadores/1/edit
  def edit
  end

  # POST /intranet/financeiro_portadores or /intranet/financeiro_portadores.json
  def create
    @intranet_financeiro_portadore = Intranet::FinanceiroPortadore.new(intranet_financeiro_portadore_params)

    respond_to do |format|
      if @intranet_financeiro_portadore.save
        format.html { redirect_to @intranet_financeiro_portadore, notice: "Financeiro portadore was successfully created." }
        format.json { render :show, status: :created, location: @intranet_financeiro_portadore }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @intranet_financeiro_portadore.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /intranet/financeiro_portadores/1 or /intranet/financeiro_portadores/1.json
  def update
    respond_to do |format|
      if @intranet_financeiro_portadore.update(intranet_financeiro_portadore_params)
        format.html { redirect_to @intranet_financeiro_portadore, notice: "Financeiro portadore was successfully updated." }
        format.json { render :show, status: :ok, location: @intranet_financeiro_portadore }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @intranet_financeiro_portadore.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /intranet/financeiro_portadores/1 or /intranet/financeiro_portadores/1.json
  def destroy
    @intranet_financeiro_portadore.destroy
    respond_to do |format|
      format.html { redirect_to intranet_financeiro_portadores_url, notice: "Financeiro portadore was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_intranet_financeiro_portadore
      @intranet_financeiro_portadore = Intranet::FinanceiroPortadore.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def intranet_financeiro_portadore_params
      params.require(:intranet_financeiro_portadore).permit(:arquivo, :cnpj, :codigo_banco, :agencia, :carteira, :conta, :aceite, :empresa, :especie_titulo, :moeda, :numero_inicial_1, :numero_inicial_2, :numero_final, :registro_online, :nome_certificado, :senha_certificado)
    end
end
