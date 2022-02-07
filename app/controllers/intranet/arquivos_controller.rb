class Intranet::ArquivosController < ApplicationController
	before_action :valida_acesso
  before_action :set_intranet_arquivo, only: %i[ show edit update destroy ]
  authorize_resource :class => false
  # GET /intranet/arquivos or /intranet/arquivos.json
  def index
    if user_signed_in?
      @intranet_arquivos = Intranet::Arquivo.all.where(intranet_cartorio_id: ["0",@cart_current.id]).where(ativo: true).order(created_at: :desc).consulta_por_status(params[:status]).page(params[:page]).per(10)
    else
      @intranet_arquivos = Intranet::Arquivo.all.consulta_por_status(params[:status]).page(params[:page]).per(10)
    end
  end

  # GET /intranet/arquivos/1 or /intranet/arquivos/1.json
  def show
    @intranet_cartorios = Intranet::Cartorio.all
    @intranet_tipos = Intranet::ArquivosTipo.all  
    if user_signed_in?
      if (@intranet_arquivo.cart_visualizados_ids & [current_user.aux_cartorio_id]).any? == false
        @intranet_arquivo.cart_visualizados_ids << current_user.aux_cartorio_id
        @intranet_arquivo.save
      end
    end
  end

  # GET /intranet/arquivos/new
  def new
    @intranet_arquivo = Intranet::Arquivo.new
    @intranet_cartorios = Intranet::Cartorio.all.order(:intranet_cidade_id)
    @intranet_cartorios.each do | cart |
      @cidade = Intranet::Cidade.find(cart.intranet_cidade_id)
      if @cidade  
        cart.nome = @cidade.municipio + " - " + cart.nome
      end
    end 
    @intranet_tipo = Intranet::ArquivosTipo.all
  end

  # GET /intranet/arquivos/1/edit
  def edit
    @intranet_cartorios = Intranet::Cartorio.all
    @intranet_tipo = Intranet::ArquivosTipo.all
  end

  # POST /intranet/arquivos or /intranet/arquivos.json
  def create
    @intranet_arquivo = Intranet::Arquivo.new(intranet_arquivo_params)

    respond_to do |format|
      if @intranet_arquivo.save
        format.html { redirect_to @intranet_arquivo, notice: "Arquivo foi criado com sucesso." }
        format.json { render :show, status: :created, location: @intranet_arquivo }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @intranet_arquivo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /intranet/arquivos/1 or /intranet/arquivos/1.json
  def update
    respond_to do |format|
      if @intranet_arquivo.update(intranet_arquivo_params)
        format.html { redirect_to @intranet_arquivo, notice: "Arquivo foi atualizado com sucesso." }
        format.json { render :show, status: :ok, location: @intranet_arquivo }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @intranet_arquivo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /intranet/arquivos/1 or /intranet/arquivos/1.json
  def destroy
    @intranet_arquivo.destroy
    respond_to do |format|
      format.html { redirect_to intranet_arquivos_url, notice: "Arquivo foi deletado com sucesso." }
      format.json { head :no_content }
    end
  end
  def delete_doc_attachment
		@doc = ActiveStorage::Attachment.find(params[:idb])
		@doc.purge  
		flash[:notice] = "Documento Deletado" 
		redirect_to intranet_arquivo_path(params[:ida])
	end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_intranet_arquivo
      @intranet_arquivo = Intranet::Arquivo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def intranet_arquivo_params
      params.require(:intranet_arquivo).permit(:intranet_arquivos_tipo_id, :intranet_cartorio_id, :ativo, :descricao, :arquivos => [])
    end
end
