class Intranet::PresencsController < ApplicationController
	before_action :valida_acesso, except: %i[ cancelar_insc_evento fazer_pagamento ]  
  authorize_resource :class => false
  before_action :set_intranet_presenc, only: %i[ destroy fazer_pagamento ]  

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
    @intranet_event = Intranet::Event.find(params[:m_id])
    if @intranet_event
      @qtd_vaga = @intranet_event.qtd_insc_cart.to_i - Intranet::Presenc.where.not(status: 'Cancelado').where(m_id: @intranet_event.id,intranet_associado_id:params[:intranet_associado_id],intranet_cartorio_id: params[:cart_id]).size
      if @qtd_vaga > 0  
        @presenc = Intranet::Presencs::CriarPresencJob.perform_later(params[:email],params[:ingresso_nome],@intranet_event.id,"evento",params[:intranet_associado_id],params[:cart_id],params[:cracha_nome],params[:funcao],params[:telefone],params[:whatsapp])          
        respond_to do |format| 
          format.json { render json: true  }
        end 
      end
    end 
	end
     
  def cancelar_insc_evento   
    @intranet_presenc = Intranet::Presenc.find(params[:id])
    @intranet_presenc.update(status: "Cancelado") 
    if params[:m_name] == 'evento'
      @evento = Intranet::Event.find(params[:m_id])
      redirect_to @evento 
    end
  end 
  
  private
    def set_intranet_presenc
      @intranet_presenc = Intranet::Presenc.find(params[:id])
    end

    def intranet_presenc_params
      params.require(:intranet_presenc).permit(:m_id, :m_name, :intranet_associado_id,:intranet_cartorio_id,:status,:cracha_nome,:funcao,:numero,:telefone,:whatsapp,:pago)
    end
end
