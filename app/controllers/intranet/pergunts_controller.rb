class Intranet::PerguntsController < ApplicationController
	before_action :valida_acesso  
  authorize_resource :class => false
  before_action :set_intranet_pergunt, only: %i[ show edit update destroy ]

  # GET /intranet/pergunts or /intranet/pergunts.json
  def index
    if user_signed_in?  
      @cartorio = Intranet::Cartorio.pesquisa_cart_id(current_user.aux_cartorio_id) 
      @intranet_cartorios_consult = Intranet::Cartorio.all
      @associados_aux  = Intranet::Associado.where('intranet_cartorio && ARRAY[?]::integer[]' [current_user.aux_cartorio_id])    
      @intranet_pergunts = Intranet::Pergunt.consulta_por_palavra(params[:palavra_1],params[:intecec_1],params[:palavra_2],params[:intecec_2],params[:palavra_3]).order(visualizada_at: :desc).where(intranet_associado_id: current_user.id).consulta_por_status(params[:status]).page(params[:page]).per(10)
    else 
      @intranet_pergunts = Intranet::Pergunt.consulta_por_palavra(params[:palavra_1],params[:intecec_1],params[:palavra_2],params[:intecec_2],params[:palavra_3]).order(visualizada_at: :desc).consulta_por_status(params[:status]).page(params[:page]).per(10)
    end
  end

  # GET /intranet/pergunts/1 or /intranet/pergunts/1.json
  def show
    @associado = Intranet::Associado.find_by_id(@intranet_pergunt.intranet_associado_id)  
    if user_signed_in? && @intranet_pergunt.mensagem_resposta != nil 
      @intranet_pergunt.visualizada = true
      @intranet_pergunt.visualizada_at = Time.now
      @intranet_pergunt.save
    end
  end

  # GET /intranet/pergunts/new
  def new
    @intranet_pergunt = Intranet::Pergunt.new 
    if user_signed_in?
      @associado = Intranet::Associado.where(user_id: current_user.id).take
    end
  end

  # GET /intranet/pergunts/1/edit
  def edit
    @associado = Intranet::Associado.find_by_id(@intranet_pergunt.intranet_associado_id)  
  end

  # POST /intranet/pergunts or /intranet/pergunts.json
  def create 
    if user_signed_in?
      @intranet_pergunt = Intranet::Pergunt.new(intranet_pergunt_params.merge(status: @status,intranet_associado_id: current_user.id))
    else
      @intranet_pergunt = Intranet::Pergunt.new(intranet_pergunt_params.merge(status: @status))
    end

    respond_to do |format|
      if @intranet_pergunt.save
        format.html { redirect_to @intranet_pergunt, notice: "Pergunta criada com sucesso." }
        format.json { render :show, status: :created, location: @intranet_pergunt }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @intranet_pergunt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /intranet/pergunts/1 or /intranet/pergunts/1.json
  def update
    respond_to do |format| 
      if current_admin 
        if params[:intranet_pergunt][:mensagem_pergunta] == nil
          @status = "Respondido por: #{current_admin.nome}"
        end
        @profissional_id = current_admin.id
      else
        @status          = @intranet_pergunt.profissional_id
        @profissional_id = @intranet_pergunt.status
      end
      if @intranet_pergunt.update(intranet_pergunt_params.merge(status:@status,profissional_id:@profissional_id))
        format.html { redirect_to @intranet_pergunt, notice: "Pergunta editada com sucesso." }
        format.json { render :show, status: :ok, location: @intranet_pergunt }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @intranet_pergunt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /intranet/pergunts/1 or /intranet/pergunts/1.json
  def destroy
    @intranet_pergunt.destroy
    respond_to do |format|
      format.html { redirect_to intranet_pergunts_url, notice: "Pergunta excluido com sucesso." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_intranet_pergunt
      @intranet_pergunt = Intranet::Pergunt.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def intranet_pergunt_params
      params.require(:intranet_pergunt).permit(:mensagem_pergunta, :tipo, :intranet_associado_id, :assunto, :profissional_id, :mensagem_resposta)
    end
end
