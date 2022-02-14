class Intranet::ContribuicaoImportadasController < ApplicationController
	before_action :valida_acesso 
	authorize_resource :class => false
  before_action :set_intranet_contribuicao_importada, only: %i[ show edit update destroy ]

  def index
    @intranet_contribuicao_importadas = Intranet::ContribuicaoImportada.all.consulta_por_cart(params[:intranet_cartorio_id]).consulta_por_ano(params[:ano]).page(params[:page]).per(10).order(ano: :DESC)
    @data_ultima_atualizacao = Intranet::RelatoriosContribuicao.all.order(:created_at).where(status: "sucesso").last.try(:data)
    @cartorios        = Intranet::Cartorio.all.order(:intranet_cidade_id)
    @intranet_cidades = Intranet::Cidade.all
    @cartorios.each do |cart|
			@cidade = @intranet_cidades.find_by_id(cart.intranet_cidade_id)
			cart.nome = "#{@cidade.municipio} - #{cart.nome}"
		end
  end

  def show
    @cartorio  = Intranet::Cartorio.all.find(@intranet_contribuicao_importada.intranet_cartorio_id)
    @associado = Intranet::Associado.find(@cartorio.intranet_associado_id) if @cartorio.intranet_associado_id
    @cidade    = Intranet::Cidade.all.find_by_id(@cartorio.intranet_cidade_id)
    @cartorio.nome = "#{@cidade.municipio} - #{@cartorio.nome}"
  end

  def new
    @intranet_contribuicao_importada = Intranet::ContribuicaoImportada.new
  end
  def relatoriosIndex
    @relatorios_aux = Intranet::RelatoriosContribuicao.all
    @relatorios = @relatorios_aux.all.consulta_por_data(params[:ano]).consulta_por_status(params[:status]).order(created_at: :DESC).page(params[:page]).per(10)
    @data_ultima_atualizacao = @relatorios_aux.where(status: "sucesso").last.try(:data)
  end
  def relatoriosShow 
    @relatorio = Intranet::RelatoriosContribuicao.find(params[:id])
  end
  def edit
  end

  def create
    @intranet_contribuicao_importada = Intranet::ContribuicaoImportada.new(intranet_contribuicao_importada_params) 
    respond_to do |format|
      if @intranet_contribuicao_importada.save
        format.html { redirect_to @intranet_contribuicao_importada, notice: "Contribuicao importada foi criada com sucesso." }
        format.json { render :show, status: :created, location: @intranet_contribuicao_importada }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @intranet_contribuicao_importada.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @intranet_contribuicao_importada.update(intranet_contribuicao_importada_params)
        format.html { redirect_to @intranet_contribuicao_importada, notice: "Contribuicao importada foi atualizada com sucesso." }
        format.json { render :show, status: :ok, location: @intranet_contribuicao_importada }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @intranet_contribuicao_importada.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @intranet_contribuicao_importada.destroy
    respond_to do |format|
      format.html { redirect_to intranet_contribuicao_importadas_url, notice: "Contribuicao importada foi deletado com sucesso." }
      format.json { head :no_content }
    end
  end

  private
    def set_intranet_contribuicao_importada
      @intranet_contribuicao_importada = Intranet::ContribuicaoImportada.find(params[:id])
    end

    def intranet_contribuicao_importada_params
      params.require(:intranet_contribuicao_importada).permit(:ano, :documento)
    end
end
