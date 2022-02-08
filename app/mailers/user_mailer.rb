class UserMailer < ApplicationMailer   
  def criado_com_sucesso(user) 
    @user = user  
    @nome_abrev = @user.nome.split(" ")
    @nome_abrev = @nome_abrev[0] + " " + @nome_abrev[1]
    mail to: 'gust904@gmail.com', subject: "Bem Vindo"
  end
  def criado_com_sucesso_popup(user)
    @user       = user
    @associado  = Intranet::Associado.where(user_id: @user.id).take
    @cartorios  = Intranet::Cartorio.where(id: @associado.intranet_cartorio)
    @cidades    = Intranet::Cidade.all 
    @nome_abrev = @user.nome.split(" ")
    @nome_abrev = @nome_abrev[0] + " " + @nome_abrev[1]
    mail to: "gust904@gmail.com", subject: "Novo Filiado Pendente de Liberação"
  end
end
