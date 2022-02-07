class Intranet::TabeliaosController < ApplicationController
	before_action :valida_acesso  
  authorize_resource :class => false
  before_action :set_intranet_tabeliao, only: %i[ show edit update destroy consultar_cartorios_edit]

  # GET /intranet/tabeliaos or /intranet/tabeliaos.json
  def index
    if params[:intranet_cartorio_id].present? or params[:situacao].present?
      @intranet_tabeliaos = Intranet::Tabeliao.all
      if params[:intranet_cartorio_id].present?
        @intranet_tabeliaos = @intranet_tabeliaos.consulta_por_cartorio_id(params[:intranet_cartorio_id]).page(params[:page]).per(10)
      end
      if params[:situacao].present?
        @intranet_tabeliaos = @intranet_tabeliaos.consulta_por_atual(params[:situacao]).page(params[:page]).per(10)
      end
    else 
      @intranet_tabeliaos = Intranet::Tabeliao.all.page(params[:page]).per(10)
    end
    @intranet_cartorios   = Intranet::Cartorio.all.order(:intranet_cidade_id)
    @intranet_cartorios.each do |cart|
			@cidade = Intranet::Cidade.find_by_id(cart.intranet_cidade_id)
			cart.nome = "#{@cidade.municipio} - #{cart.nome}"
		end
  end

  # GET /intranet/tabeliaos/1 or /intranet/tabeliaos/1.json
  def show
    @intranet_cart = Intranet::Cartorio.find_by_id(@intranet_tabeliao.cart_ref_id)
  end

  def consultar_cartorios_edit
    @cart     = Intranet::Cartorio.all.find_by_id(params[:cart_id])  
    if @cart
      if @intranet_tabeliao
        if @cart.intranet_tabeliao_id.to_s != @intranet_tabeliao.id.to_s
          if @cart.intranet_tabeliao_id == "" or @cart.intranet_tabeliao_id == nil
            @responce = true
            respond_to do |format| 
              format.json { render json: @responce }
            end 
          else
            @responce = false
            respond_to do |format| 
              format.json { render json: @responce }
            end 
          end
        else
          @responce = true
          respond_to do |format| 
            format.json { render json: @responce }
          end 
        end
      else
        if @cart.intranet_tabeliao_id == "" or @cart.intranet_tabeliao_id == nil
          @responce = true
          respond_to do |format| 
            format.json { render json: @responce }
          end 
        else
          @responce = false
          respond_to do |format| 
            format.json { render json: @responce }
          end 
        end
      end
    else
      @responce = false
      respond_to do |format| 
        format.json { render json: @responce }
      end 
    end
  end
  def consultar_cartorios_new
    @cart = Intranet::Cartorio.find_by_id(params[:cart_id])  
    if @cart 
      if @cart.intranet_tabeliao_id == "" or @cart.intranet_tabeliao_id == nil
        @responce = true
        respond_to do |format| 
          format.json { render json: @responce }
        end 
      else
        @responce = false
        respond_to do |format| 
          format.json { render json: @responce }
        end 
      end 
    end
  end
  # GET /intranet/tabeliaos/new
  def new
    @intranet_tabeliao  = Intranet::Tabeliao.new 
    @cartorios = Intranet::Cartorio.all
    @id_cart            = nil
  end

  # GET /intranet/tabeliaos/1/edit
  def edit 
    @id_cart   = Intranet::Cartorio.where(intranet_tabeliao_id: @intranet_tabeliao.id).take.try(:id) 
    @cartorios = Intranet::Cartorio.all
  end

  # POST /intranet/tabeliaos or /intranet/tabeliaos.json
  def create
    @cart = Intranet::Cartorio.find_by_id(params[:intranet_tabeliao][:intranet_cartorio_id])
    @intranet_tabeliao = Intranet::Tabeliao.new(intranet_tabeliao_params.merge(atual?: to_boolean(params[:intranet_tabeliao][:atual]),cart_ref_id: @cart.id))
    respond_to do |format|
      if @intranet_tabeliao.save 
        if @intranet_tabeliao.atual?
          @cart.update(intranet_tabeliao_id: @intranet_tabeliao.id)  
        else
          @cart.update(intranet_tabeliao_id: nil)  
        end
        format.html { redirect_to @intranet_tabeliao, notice: "Tabelião foi criado com sucesso." }
        format.json { render :show, status: :created, location: @intranet_tabeliao }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @intranet_tabeliao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /intranet/tabeliaos/1 or /intranet/tabeliaos/1.json
  def update 
    @cart = Intranet::Cartorio.find_by_id(params[:intranet_tabeliao][:intranet_cartorio_id])
    respond_to do |format|
      if @intranet_tabeliao.update(intranet_tabeliao_params.merge(atual?: to_boolean(params[:intranet_tabeliao][:atual]),cart_ref_id: @cart.id)) 
        if @intranet_tabeliao.atual?
          @cart.update(intranet_tabeliao_id: @intranet_tabeliao.id)  
        else
          @cart.update(intranet_tabeliao_id: nil)  
        end
        format.html { redirect_to @intranet_tabeliao, notice: "Tabelião foi atualizado com sucesso." }
        format.json { render :show, status: :ok, location: @intranet_tabeliao }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @intranet_tabeliao.errors, status: :unprocessable_entity }
      end
    end
  end
  def to_boolean(var)
    case var
      when true, 'true', 1, '1'
        return true
      when false, 'false', 0, '0'
        return false
    end
  end
  # DELETE /intranet/tabeliaos/1 or /intranet/tabeliaos/1.json
  def destroy 
    @cart = Intranet::Cartorio.where(intranet_tabeliao_id: @intranet_tabeliao.id).take 
    @cart.update(intranet_tabeliao_id: nil)
    @intranet_tabeliao.destroy
    respond_to do |format|
      format.html { redirect_to intranet_tabeliaos_url, notice: "Tabelião foi deletado com sucesso." }
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
      params.require(:intranet_tabeliao).permit( :cpf, :rg, :nome, :telefone, :whatsapp, :email, :atual?)
    end
end
