class UserMailer < ApplicationMailer 
  default from: 'suporte@sinoredice.org.br'  
  def criado_com_sucesso(user) 
    @user = user  
    @nome_abrev = @user.nome.split(" ")
    @nome_abrev = @nome_abrev[0] + " " + @nome_abrev[1]
    mail to: @user.email, subject: "Bem Vindo"
  end
  def criado_com_sucesso_popup(user)
    @user       = user
    @associado  = Intranet::Associado.where(user_id: @user.id).take
    @cartorio   = Intranet::Cartorio.find(@associado.intranet_cartorio_id)
    @cidade     = Intranet::Cidade.find(@cartorio.intranet_cidade_id)
    @nome_abrev = @user.nome.split(" ")
    @nome_abrev = @nome_abrev[0] + " " + @nome_abrev[1]
    mail to: "suporte@sinoredice.org.br", subject: "Novo Filiado Pendente de Liberação"
  end
end
