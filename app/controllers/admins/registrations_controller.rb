# frozen_string_literal: true

class Admins::RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_admin!, :valida_acesso, only: [:edit]
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]  
  def new   
		if admin_signed_in?
			redirect_to administrador_home_path
		else 
			if user_signed_in?
				redirect_to usuario_home_path
			end
		end
    @privilegios = Intranet::Privilegio.where(ativo: true) 
    @dapartamentos = Intranet::Departamento.where(ativo: true) 
    super
  end
 
  def create 
    @privilegios = Intranet::Privilegio.where(ativo: true) 
    @dapartamentos = Intranet::Departamento.where(ativo: true)  
    super
  end
  def edit 
    @privilegios = Intranet::Privilegio.where(ativo: true) 
    @dapartamentos = Intranet::Departamento.where(ativo: true) 
    @edit = false if current_admin.isAdmin 
    super  
  end 
  def update
    @privilegios = Intranet::Privilegio.where(ativo: true) 
    @dapartamentos = Intranet::Departamento.where(ativo: true) 
    @edit = false if current_admin.isAdmin
    if params[:admin][:password].blank?
      params[:admin][:password] = params[:admin][:current_password]
      params[:admin][:password_confirmation] = params[:admin][:current_password]
    else
      params[:admin][:senhaPadrao] = "1" 
    end    
    if @admin.update(admin_params)  
      flash[:success] = "Modificações feitas com sucesso"
      sign_in(current_admin, :bypass => true)
      redirect_to edit_admin_registration_path(@admin)
    end  
  end
 
  def destroy
    super
  end
 
  def cancel
    super
  end
 
  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :nome, :email,:avatar,  :acesso, :password, :password_confirmation,:cpf,:senhaPadrao, :lembrete, privilegio_id: [], departamento_id: []])
  end
 
  def configure_account_update_params
    devise_parameter_sanitizer.permit( :account_update, keys: [:nome,:avatar, :email,  :acesso, :password, :password_confirmation,:senhaPadrao,:cpf, :lembrete, privilegio_id: [], departamento_id: []]) 
  end
  def admin_params
    params.require(:admin).permit(:avatar_file_name, :avatar_content_type, :nome, :isAdmin, :email,  :acesso,:password, :password_confirmation,:cpf, :lembrete,:avatar,:senhaPadrao, privilegio_id: [], departamento_id: [])
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
