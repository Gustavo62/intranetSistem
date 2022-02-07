class Intranet::ArquivosTiposController < ApplicationController
	before_action :valida_acesso
  before_action :set_intranet_arquivos_tipo, only: %i[ show edit update destroy ]
  authorize_resource :class => false
 
  def index
    @intranet_arquivos_tipos = Intranet::ArquivosTipo.consulta_por_status(params[:status]) 
  end
 
  def show
  end
 
  def new
    @intranet_arquivos_tipo = Intranet::ArquivosTipo.new
  end
 
  def edit
  end
 
  def create
    @intranet_arquivos_tipo = Intranet::ArquivosTipo.new(intranet_arquivos_tipo_params)

    respond_to do |format|
      if @intranet_arquivos_tipo.save
        format.html { redirect_to @intranet_arquivos_tipo, notice: "Tipo de arquivos foi criado com sucesso." }
        format.json { render :show, status: :created, location: @intranet_arquivos_tipo }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @intranet_arquivos_tipo.errors, status: :unprocessable_entity }
      end
    end
  end
 
  def update
    respond_to do |format|
      if @intranet_arquivos_tipo.update(intranet_arquivos_tipo_params)
        format.html { redirect_to @intranet_arquivos_tipo, notice: "Tipo de arquivos foi editada com sucesso." }
        format.json { render :show, status: :ok, location: @intranet_arquivos_tipo }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @intranet_arquivos_tipo.errors, status: :unprocessable_entity }
      end
    end
  end
 
  def destroy
    @intranet_arquivos_tipo.destroy
    respond_to do |format|
      format.html { redirect_to intranet_arquivos_tipos_url, notice: "Tipo de arquivos foi excluido com sucesso." }
      format.json { head :no_content }
    end
  end

  private 
    def set_intranet_arquivos_tipo
      @intranet_arquivos_tipo = Intranet::ArquivosTipo.find(params[:id])
    end
 
    def intranet_arquivos_tipo_params
      params.require(:intranet_arquivos_tipo).permit(:descricao, :ativo)
    end
end
