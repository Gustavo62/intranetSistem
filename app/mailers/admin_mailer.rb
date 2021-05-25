class AdminMailer < ApplicationMailer

  default from: 'suporte@sinoredice.org.br'  
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
end
