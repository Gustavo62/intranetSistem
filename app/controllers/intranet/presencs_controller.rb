class Intranet::PresencsController < ApplicationController
	before_action :valida_acesso  
  authorize_resource :class => false
  before_action :set_intranet_presenc, only: %i[ show edit update destroy fazer_pagamento]

  def index
    @intranet_presencs = Intranet::Presenc.all
  end

  def show 
  end

  def new
    @intranet_presenc = Intranet::Presenc.new
  end 
  
  def fazer_pagamento  
    @presenca = Intranet::Presenc.find(params[:id])
    if params[:tipo] == 'evento'
      @evento = Intranet::Event.find(@presenca.m_id)
      @intranet_boleto    = Intranet::Boleto.new(
      intranet_associado_id: @presenca.intranet_associado_id, 
      valor:                 @evento.valor,
      vencimento:            @evento.data_max_pagamento, 
      descricao:             @evento.titulo,  
      tipo:                  'evento',
      metodo:                'avulso')
    end
    if @intranet_boleto.save
      @presenca.update(intranet_boleto_id: @intranet_boleto.id)
      Intranet::Boleto.createBoleto(@intranet_boleto,current_user.aux_cartorio_id) 
      @boleto = BoletoSimples::BankBillet.find(@intranet_boleto.id_boleto) 
      redirect_to @boleto.url 
    end
  end

	def se_inscrever 
    # Bloco evento
    if params[:m_name] == 'evento'
      @intranet_event = Intranet::Event.find(params[:m_id])
      if @intranet_event
        @qtd_vaga = @intranet_event.qtd_insc_cart.to_i - Intranet::Presenc.where(m_id: @intranet_event.id).size
        if @qtd_vaga > 0 
          @intranet_presenc = Intranet::Presenc.create(ingresso_nome: params[:ingresso_nome],m_id:@intranet_event.id, m_name:"evento", intranet_associado_id:params[:intranet_associado_id])
          if @intranet_presenc.save
            respond_to do |format|
              format.json { render json: true  }
            end
          else 
            respond_to do |format|
              format.json { render json: false  }
            end
          end
        end
      end
    end

    
    # Bloco reunião
	end
  
  def edit
  end

  def create
    @intranet_presenc = Intranet::Presenc.new(intranet_presenc_params)

    respond_to do |format|
      if @intranet_presenc.save
        format.html { redirect_to @intranet_presenc}
        format.json { render :show, status: :created, location: @intranet_presenc }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @intranet_presenc.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @intranet_presenc.update(intranet_presenc_params)
        format.html { redirect_to @intranet_presenc}
        format.json { render :show, status: :ok, location: @intranet_presenc }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @intranet_presenc.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy 
    @intranet_presenc.destroy
    if params[:m_name] == "evento"
      @event = Intranet::Event.find(params[:m_id])
      redirect_to intranet_event_path(@event)
    else 
      @reunion = Intranet::Reunion.find(params[:m_id])
      redirect_to intranet_event_path(@reunion)
    end
  end

  private
    def set_intranet_presenc
      @intranet_presenc = Intranet::Presenc.find(params[:id])
    end

    def intranet_presenc_params
      params.require(:intranet_presenc).permit(:m_id, :m_name, :intranet_associado_id)
    end
end
