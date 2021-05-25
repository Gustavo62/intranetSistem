# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/criado_com_sucesso
  def criado_com_sucesso
    UserMailer.criado_com_sucesso
  end

end
