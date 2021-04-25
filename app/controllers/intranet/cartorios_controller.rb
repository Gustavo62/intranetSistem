class Intranet::CartoriosController < ApplicationController
  before_action :set_intranet_cartorio, only: %i[ show edit update destroy ]

  # GET /intranet/cartorios or /intranet/cartorios.json
  def index
    @intranet_cartorios = Intranet::Cartorio.all
  end

  # GET /intranet/cartorios/1 or /intranet/cartorios/1.json
  def show
  end

  # GET /intranet/cartorios/new
  def new
    @intranet_cartorio = Intranet::Cartorio.new
  end

  # GET /intranet/cartorios/1/edit
  def edit
  end

  # POST /intranet/cartorios or /intranet/cartorios.json
  def create
    @intranet_cartorio = Intranet::Cartorio.new(intranet_cartorio_params)

    respond_to do |format|
      if @intranet_cartorio.save
        format.html { redirect_to @intranet_cartorio, notice: "Cartorio was successfully created." }
        format.json { render :show, status: :created, location: @intranet_cartorio }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @intranet_cartorio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /intranet/cartorios/1 or /intranet/cartorios/1.json
  def update
    respond_to do |format|
      if @intranet_cartorio.update(intranet_cartorio_params)
        format.html { redirect_to @intranet_cartorio, notice: "Cartorio was successfully updated." }
        format.json { render :show, status: :ok, location: @intranet_cartorio }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @intranet_cartorio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /intranet/cartorios/1 or /intranet/cartorios/1.json
  def destroy
    @intranet_cartorio.destroy
    respond_to do |format|
      format.html { redirect_to intranet_cartorios_url, notice: "Cartorio was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_intranet_cartorio
      @intranet_cartorio = Intranet::Cartorio.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def intranet_cartorio_params
      params.require(:intranet_cartorio).permit(:possui_cnpj?, :cei, :cnpj, :cod_tj, :cod_cnj, :nome, :nome_fant, :nome_res, :cep, :logradouro, :numero, :bairro, :complemento, :telefone_fixo, :telefone_celular, :whatsapp, :email, :forma_branca, :observacao, :regiao_id, :contribuicao_id, :atividade_id, :entrancia_id, :boleto_id, :cidade_id, :associado_id, :substituto_id, :tabeliaes_id)
    end
end
