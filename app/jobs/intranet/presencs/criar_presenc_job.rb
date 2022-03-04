class Intranet::Presencs::CriarPresencJob < ApplicationJob
  queue_as :default

  def perform(email,ingresso_nome,m_id,m_name,intranet_associado_id,intranet_cartorio_id,cracha_nome,funcao,telefone,whatsapp)   
    @ultima_presenc = Intranet::Presenc.all.where(m_id: m_id).last 
    if @ultima_presenc
      @ultimo_numero = @ultima_presenc.numero.to_i + 1
    else
      @ultimo_numero = 1
    end 
    @intranet_presenc = Intranet::Presenc.create( ingresso_nome: ingresso_nome,
                                                  m_id: m_id,
                                                  m_name: m_name,
                                                  numero: @ultimo_numero,
                                                  intranet_associado_id: intranet_associado_id,
                                                  intranet_cartorio_id: intranet_cartorio_id,
                                                  cracha_nome: cracha_nome,
                                                  funcao: funcao,
                                                  telefone: telefone,
                                                  email: email,
                                                  whatsapp: whatsapp,
                                                  status:'Inscrito')
    if @intranet_presenc.save
      return true
    else
      return false 
    end
  end
end
