class Intranet::SubstitutosController < ApplicationController
	before_action :valida_acesso  
  authorize_resource :class => false
  before_action :set_intranet_substituto, only: %i[ show edit update destroy consultar_cartorios_edit]

  # GET /intranet/substitutos or /intranet/substitutos.json
  def index 
    if params[:intranet_cartorio_id].present? or params[:situacao].present?
      @intranet_substitutos = Intranet::Substituto.all
      if params[:intranet_cartorio_id].present?
        @intranet_substitutos = @intranet_substitutos.consulta_por_cartorio_id(params[:intranet_cartorio_id]).page(params[:page]).per(10)
      end
      if params[:situacao].present?
        @intranet_substitutos = @intranet_substitutos.consulta_por_atual(params[:situacao]).page(params[:page]).per(10)
      end
    else 
      @intranet_substitutos = Intranet::Substituto.all.page(params[:page]).per(10)
    end 
    @intranet_cartorios   = Intranet::Cartorio.all.order(:intranet_cidade_id)
    @intranet_cartorios.each do |cart|
			@cidade = Intranet::Cidade.find_by_id(cart.intranet_cidade_id)
			cart.nome = "#{@cidade.municipio} - #{cart.nome}"
		end
  end

  # GET /intranet/substitutos/1 or /intranet/substitutos/1.json
  def show
    @intranet_cart = Intranet::Cartorio.find_by_id(@intranet_substituto.cart_ref_id)
  end

  # GET /intranet/substitutos/new
  def new
    @intranet_substituto = Intranet::Substituto.new
    @cartorios = Intranet::Cartorio.all
    @id_cart            = nil
  end
  
  def to_boolean(var)
    case var
      when true, 'true', 1, '1'
        return true
      when false, 'false', 0, '0'
        return false
    end
  end 
  
  # GET /intranet/substitutos/1/edit
  def edit
    @id_cart   = Intranet::Cartorio.where(intranet_substituto_id: @intranet_substituto.id).take.try(:id) 
    @cartorios = Intranet::Cartorio.all
  end

  # POST /intranet/substitutos or /intranet/substitutos.json
  def create
    @cart = Intranet::Cartorio.find_by_id(params[:intranet_substituto][:intranet_cartorio_id])
    @intranet_substituto = Intranet::Substituto.new(intranet_substituto_params.merge(atual?: to_boolean(params[:intranet_substituto][:atual]),cart_ref_id: @cart.id,dt_inicio: Time.now))

    respond_to do |format|
      if @intranet_substituto.save
        if @intranet_substituto.atual?
          @cart.update(intranet_substituto_id: @intranet_substituto.id)  
        else
          @cart.update(intranet_substituto_id: nil)  
        end
        format.html { redirect_to @intranet_substituto, notice: "Substituto foi criado com sucesso." }
        format.json { render :show, status: :created, location: @intranet_substituto }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @intranet_substituto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /intranet/substitutos/1 or /intranet/substitutos/1.json
  def update
    @cart = Intranet::Cartorio.find_by_id(params[:intranet_substituto][:intranet_cartorio_id])
    respond_to do |format|
      if @intranet_substituto.update(intranet_substituto_params.merge(atual?: to_boolean(params[:intranet_substituto][:atual]),cart_ref_id: @cart.id))
        if @intranet_substituto.atual?
          @cart.update(intranet_substituto_id: @intranet_substituto.id)  
        else
          @cart.update(intranet_substituto_id: nil)  
        end
        format.html { redirect_to @intranet_substituto, notice: "Substituto foi atualizado com sucesso." }
        format.json { render :show, status: :ok, location: @intranet_substituto }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @intranet_substituto.errors, status: :unprocessable_entity }
      end
    end
  end
  def consultar_cartorios_edit
    @cart     = Intranet::Cartorio.all.find_by_id(params[:cart_id])  
    if @cart
      if @intranet_substituto
        if @cart.intranet_substituto_id.to_s != @intranet_substituto.id.to_s
          if @cart.intranet_substituto_id == "" or @cart.intranet_substituto_id == nil
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
        if @cart.intranet_substituto_id == "" or @cart.intranet_substituto_id == nil
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
      if @cart.intranet_substituto_id == "" or @cart.intranet_substituto_id == nil
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
  # DELETE /intranet/substitutos/1 or /intranet/substitutos/1.json
  def destroy
    @cart = Intranet::Cartorio.where(intranet_substituto_id: @intranet_substituto.id).take 
    @cart.update(intranet_substituto_id: nil)
    @intranet_substituto.destroy
    respond_to do |format|
      format.html { redirect_to intranet_substitutos_url, notice: "Substituto foi deletado com sucesso." }
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
