# frozen_string_literal: true

class Admins::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create] 
  def new
    if user_signed_in? 
      redirect_to usuario_home_path
    else   
      if admin_signed_in?  
        redirect_to administrador_home_path
      else
        super 
        flash.delete(:notice)
      end
    end
  end 
  def create 
    super 
    flash.delete(:notice)
    if resource.senhaPadrao == false  
      flash[:alert] = "Olá Bem vindo, #{resource.nome}! bem vindo de volta!, atualize sua senha <a href=\"#{edit_admin_registration_path(@admin)}\">AQUI</a"
    else 
      flash[:success] = "Olá Bem vindo, #{resource.nome}! bem vindo de volta!"
    end
  end 
  def destroy
    super    
  end
  protected 
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:cpf, :password])
  end
end
