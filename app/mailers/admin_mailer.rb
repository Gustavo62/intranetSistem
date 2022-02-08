class AdminMailer < ApplicationMailer  
  def cad_deferido(user,assunto,msg)
    @msg  = msg
    @user = user
    @nome_abrev = @user.nome.split(" ")
    @nome_abrev = @nome_abrev[0] + " " + @nome_abrev[1]
    mail to: @user.email, subject: assunto
  end
  def cad_indeferido(user,assunto,msg)
    @msg  = msg
    @user = user
    @nome_abrev = @user.nome.split(" ")
    @nome_abrev = @nome_abrev[0] + " " + @nome_abrev[1]
    mail to: @user.email, subject: assunto
  end 
  def aviso_new(cart,aviso)
    @intranet_aviso  = aviso
    @atividades = Intranet::Atividade.all
    @cartorio = cart
    mail to: 'gust904@gmail.com', subject: @intranet_aviso.titulo
  end 
  def notificacao_mensal_assoc(id_boleto)
    @boleto  = Intranet::Boleto.find(id_boleto)
    @user    = Intranet::Associado.find(@boleto.intranet_associado_id)
    mail to: 'gust904@gmail.com', subject: 'Nova Cobrança'
    # production
    # mail to: destinatario, subject: 'Nova Cobrança' 
  end 
  def maladireta(cartorio_email,id_mala_direta)
    @mala_direta  = Intranet::MalaDiretum.find(id_mala_direta) 
    mail to: 'gust904@gmail.com', subject: @mala_direta.assunto
    # production
    # mail to: cartorio, subject: @mala_direta.assunto
  end
end
