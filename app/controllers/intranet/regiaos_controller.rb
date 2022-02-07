class Intranet::RegiaosController < ApplicationController
	before_action :valida_acesso  
  authorize_resource :class => false
  before_action :set_intranet_regiao, only: %i[ show edit update destroy ]
  # GET /intranet/regiaos or /intranet/regiaos.json
  def index
    @intranet_regiaos = Intranet::Regiao.consulta_por_status(params[:status])
  end

  # GET /intranet/regiaos/1 or /intranet/regiaos/1.json
  def show
  end

  # GET /intranet/regiaos/new
  def new
    @intranet_regiao = Intranet::Regiao.new
  end

  # GET /intranet/regiaos/1/edit
  def edit
  end

  # POST /intranet/regiaos or /intranet/regiaos.json
  def create
    @intranet_regiao = Intranet::Regiao.new(intranet_regiao_params)

    respond_to do |format|
      if @intranet_regiao.save
        format.html { redirect_to @intranet_regiao, notice: "Região criada com sucesso." }
        format.json { render :show, status: :created, location: @intranet_regiao }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @intranet_regiao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /intranet/regiaos/1 or /intranet/regiaos/1.json
  def update
    respond_to do |format|
      if @intranet_regiao.update(intranet_regiao_params)
        format.html { redirect_to @intranet_regiao, notice: "Região foi editada com sucesso." }
        format.json { render :show, status: :ok, location: @intranet_regiao }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @intranet_regiao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /intranet/regiaos/1 or /intranet/regiaos/1.json
  def destroy
    @intranet_regiao.destroy
    respond_to do |format|
      format.html { redirect_to intranet_regiaos_url, notice: "Região foi excluida com sucesso." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_intranet_regiao
      @intranet_regiao = Intranet::Regiao.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def intranet_regiao_params
      params.require(:intranet_regiao).permit(:descricao, :ativo)
    end
end
