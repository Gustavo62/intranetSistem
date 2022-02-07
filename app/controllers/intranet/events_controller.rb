class Intranet::EventsController < ApplicationController
	before_action :valida_acesso  
  authorize_resource :class => false
  before_action :set_intranet_event, only: %i[ show edit update destroy ] 
  # GET /intranet/events or /intranet/events.json
  def index
    if user_signed_in?
      @intranet_events = Intranet::Event.where(ativo: true).pesquisa_status(params[:status]).page(params[:page]).per(10)
    else 
      @intranet_events = Intranet::Event.pesquisa_status(params[:status]).page(params[:page]).per(10)
    end
  end

  # GET /intranet/events/1 or /intranet/events/1.json
  def show  
    @presencs = Intranet::Presenc.all.where(m_id: @intranet_event.id)
    @qtd_vaga = @intranet_event.qtd_insc_cart.to_i - Intranet::Presenc.where(m_id: @intranet_event.id).size
    @boletos = Intranet::Boleto.all; 
    @bilhetes = BoletoSimples::BankBillet.all; 
  end

  # GET /intranet/events/new
  def new
    @intranet_event = Intranet::Event.new
  end

  # GET /intranet/events/1/edit
  def edit
    @edit = false
  end
  # POST /intranet/events or /intranet/events.json
  def create
    if params[:intranet_event][:tipo] == '1'
      @qtd_insc_cart  = 1
      @qtd_insc_total = params[:intranet_event][:qtd_insc_total]
    else 
      @qtd_insc_cart  = params[:intranet_event][:qtd_insc_cart]
      @qtd_insc_total = (Intranet::Cartorio.where(ativo: true).size.to_i * params[:intranet_event][:qtd_insc_cart].to_i)
    end
    @intranet_event = Intranet::Event.new(intranet_event_params.merge(qtd_insc_cart: @qtd_insc_cart,qtd_insc_total:@qtd_insc_total))

    respond_to do |format|
      if @intranet_event.save
        format.html { redirect_to @intranet_event, notice: "Evento foi criado com sucesso." }
        format.json { render :show, status: :created, location: @intranet_event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @intranet_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /intranet/events/1 or /intranet/events/1.json
  def update
    if params[:intranet_event][:tipo] == '1'
      @qtd_insc_cart  = 1
      @qtd_insc_total = params[:intranet_event][:qtd_insc_total]
    else 
      @qtd_insc_cart  = params[:intranet_event][:qtd_insc_cart]
      @qtd_insc_total = (Intranet::Cartorio.where(ativo: true).size.to_i * params[:intranet_event][:qtd_insc_cart].to_i)
    end
    respond_to do |format|
      if @intranet_event.update(intranet_event_params.merge(qtd_insc_cart: @qtd_insc_cart,qtd_insc_total:@qtd_insc_total))
        format.html { redirect_to @intranet_event, notice: "Evento foi atualizado com sucesso." }
        format.json { render :show, status: :ok, location: @intranet_event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @intranet_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /intranet/events/1 or /intranet/events/1.json
  def destroy
    @intranet_event.destroy
    respond_to do |format|
      format.html { redirect_to intranet_events_url, notice: "Evento foi excluido com sucesso." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_intranet_event
      @intranet_event = Intranet::Event.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def intranet_event_params
      params.require(:intranet_event).permit(:periodo_ini, :periodo_fim, :insc_ini, :insc_fim, :titulo, :cabecalho_1, :cabecalho_2, :data_max_pagamento, :qtd_insc_total, :dias_boleto, :qtd_insc_cart, :valor, :tipo, :ativo, :link,:pago)
    end
end
