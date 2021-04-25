class Intranet::SubstitutosController < ApplicationController
  before_action :set_intranet_substituto, only: %i[ show edit update destroy ]

  # GET /intranet/substitutos or /intranet/substitutos.json
  def index
    @intranet_substitutos = Intranet::Substituto.all
  end

  # GET /intranet/substitutos/1 or /intranet/substitutos/1.json
  def show
  end

  # GET /intranet/substitutos/new
  def new
    @intranet_substituto = Intranet::Substituto.new
  end

  # GET /intranet/substitutos/1/edit
  def edit
  end

  # POST /intranet/substitutos or /intranet/substitutos.json
  def create
    @intranet_substituto = Intranet::Substituto.new(intranet_substituto_params)

    respond_to do |format|
      if @intranet_substituto.save
        format.html { redirect_to @intranet_substituto, notice: "Substituto was successfully created." }
        format.json { render :show, status: :created, location: @intranet_substituto }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @intranet_substituto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /intranet/substitutos/1 or /intranet/substitutos/1.json
  def update
    respond_to do |format|
      if @intranet_substituto.update(intranet_substituto_params)
        format.html { redirect_to @intranet_substituto, notice: "Substituto was successfully updated." }
        format.json { render :show, status: :ok, location: @intranet_substituto }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @intranet_substituto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /intranet/substitutos/1 or /intranet/substitutos/1.json
  def destroy
    @intranet_substituto.destroy
    respond_to do |format|
      format.html { redirect_to intranet_substitutos_url, notice: "Substituto was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_intranet_substituto
      @intranet_substituto = Intranet::Substituto.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def intranet_substituto_params
      params.require(:intranet_substituto).permit(:dt_inicio, :dt_final, :cpf, :rg, :nome, :telefone, :whatsapp, :email, :atual?)
    end
end
