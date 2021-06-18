# frozen_string_literal: true

class Admins::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]
 
  def new  
    @privilegios = Intranet::Privilegio.where(ativo: true)  
    super
  end
 
  def create 
    @privilegios = Intranet::Privilegio.where(ativo: true)     
    super
  end
 
  def edit
    super
  end 
  def update
    super
  end
 
  def destroy
    super
  end
 
  def cancel
    super
  end

  protected
 
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nome, :email, :password, :password_confirmation,:cpf, :lembrete, privilegio_id: [], departamento_id: []])
  end
 
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:nome, :email, :password, :password_confirmation,:cpf, :lembrete, privilegio_id: [], departamento_id: []]) 
  end
 
  def after_sign_up_path_for(resource)
    super(resource) 
  end
 
  def after_inactive_sign_up_path_for(resource)
    super(resource) 
    flash.delete(:notice)
    flash[:success] = "Até depois!"

  end
end
