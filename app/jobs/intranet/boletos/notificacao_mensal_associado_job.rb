class Intranet::Boletos::NotificacaoMensalAssociadoJob < ApplicationJob
  queue_as :default

  def perform(id_boleto) 
    AdminMailer.notificacao_mensal_assoc(id_boleto).deliver_later
  end
end