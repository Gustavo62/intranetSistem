class Intranet::Events::NotificacoesJob < ApplicationJob
  queue_as :default

  def perform(evento)
    @link = "<a href='intra.anoregce.org.br'>associado</a>"
    @mensagem = "Novo Evento Disponível, acesse o ambiente de #{@link} para ter mais detalhes."
    User.all.where(acesso: true).each do | usuario |
      @assoc = Intranet::Associado.where(user_id: usuario.id)
      @assoc.telefone_1 || @assoc.telefone_2
      AdminMailer.notifica_novo_evento(usuario.email,@mensagem)
    end  
  end
end
