class Intranet::TabeliaosController < ApplicationController
  before_action :set_intranet_tabeliao, only: %i[ show edit update destroy ]

  # GET /intranet/tabeliaos or /intranet/tabeliaos.json
  def index
    @intranet_tabeliaos = Intranet::Tabeliao.all
  end

  # GET /intranet/tabeliaos/1 or /intranet/tabeliaos/1.json
  def show
  end

  # GET /intranet/tabeliaos/new
  def new
    @intranet_tabeliao = Intranet::Tabeliao.new
  end

  # GET /intranet/tabeliaos/1/edit
  def edit
  end

  # POST /intranet/tabeliaos or /intranet/tabeliaos.json
  def create
    @intranet_tabeliao = Intranet::Tabeliao.new(intranet_tabeliao_params)

    respond_to do |format|
      if @intranet_tabeliao.save
        format.html { redirect_to @intranet_tabeliao, notice: "Tabeliao was successfully created." }
        format.json { render :show, status: :created, location: @intranet_tabeliao }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @intranet_tabeliao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /intranet/tabeliaos/1 or /intranet/tabeliaos/1.json
  def update
    respond_to do |format|
      if @intranet_tabeliao.update(intranet_tabeliao_params)
        format.html { redirect_to @intranet_tabeliao, notice: "Tabeliao was successfully updated." }
        format.json { render :show, status: :ok, location: @intranet_tabeliao }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @intranet_tabeliao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /intranet/tabeliaos/1 or /intranet/tabeliaos/1.json
  def destroy
    @intranet_tabeliao.destroy
    respond_to do |format|
      format.html { redirect_to intranet_tabeliaos_url, notice: "Tabeliao was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_intranet_tabeliao
      @intranet_tabeliao = Intranet::Tabeliao.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def intranet_tabeliao_params
      params.require(:intranet_tabeliao).permit(:dt_inicio, :dt_final, :cpf, :rg, :nome, :telefone, :whatsapp, :email, :atual?)
    end
end
