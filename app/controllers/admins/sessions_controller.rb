# frozen_string_literal: true

class Admins::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create] 
  def new
    super 
    flash.delete(:notice)
  end 
  def create 
    super 
    flash.delete(:notice)
    flash[:success] = "Olá Bem vindo, #{resource.nome}! bem vindo de volta!"
  end 
  def destroy
    super    
  end
  protected 
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [keys: [:cpf, :password]])
  end
end
