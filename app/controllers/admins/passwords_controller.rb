# frozen_string_literal: true

class Admins::PasswordsController < Devise::PasswordsController
  def new
    super
  end 
  def create
    super
  end 
  def edit
    super
  end 
  def update
    super
    flash.delete(:notice)
    flash[:success] = "Dentro de minutos, você receberá um e-mail com instruções para a troca da sua senha."
  end
  protected
  def after_resetting_password_path_for(resource)
    super(resource)
  end 
  def after_sending_reset_password_instructions_path_for(resource_name)
    super(resource_name)
  end
end
