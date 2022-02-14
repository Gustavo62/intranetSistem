# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController   
  before_action :configure_sign_in_params, only: [:create] 
  prepend_before_action :verify_signed_out_user, only: :destroy 
  def new
    if user_signed_in? == false 
      if admin_signed_in?  
        redirect_to administrador_home_path
      else
        @cartorios = Intranet::Cartorio.all.order(:intranet_cidade_id)
        @cartorios.each do |cart|
          @cidade = Intranet::Cidade.find_by_id(cart.intranet_cidade_id)
          cart.nome = "#{@cidade.municipio} - #{cart.nome}"
        end 
        super 
      end
    end
  end 
  def create    
    self.resource = warden.authenticate!(auth_options)  
    set_flash_message!(:notice, :signed_in)
    sign_in(resource_name, resource)
    yield resource if block_given?
    after_sign_in_path_for(resource) 
  end
  def destroy 
    current_user.aux_cartorio_id = nil 
    current_user.save
    super
  end
  def consulta_cart
    @resp_user  = User.where(cpf: params[:cpf].remove(".").remove("-").remove(" ")).take.try(:id)
    @resp_assoc = Intranet::Associado.where(user_id: @resp_user).pluck(:intranet_cartorio) 
    @response = Intranet::Cartorio.find(@resp_assoc)
    @response.each do | cart |
      @cidade = Intranet::Cidade.find(cart.intranet_cidade_id)
      if @cidade  
        cart.nome = @cidade.municipio + " - " + cart.nome
      end
    end 
    respond_to do | format | 
      format.json { render json: @response.pluck(:id,:nome) }
    end
  end
  protected
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:cpf, :password])
  end
  def after_sign_in_path_for(resource)    
    if resource.acesso == false   
      session.destroy
      if Intranet::FixaFiliacao.verificaFicha(resource.id)
        redirect_to user_session_path	
        link =  "<a href=\"http://www.anoregce.org.br/\">aqui</a>" 
        flash.delete(:notice)
        flash[:info] = "Seu acesso ainda não foi liberado. Entre em contato com a Anoreg, para falar conosco clique #{link}."
      else    
        redirect_to "/confirmar/cadastro?id=#{resource.id}"
      end
    else 
      set_login_token  if params[:intranet_cartorio_id]
      redirect_to root_path
    end
  end
  def verify_signed_out_user
    if all_signed_out?
      set_flash_message! :notice, :already_signed_out 
      respond_to_on_destroy
    end
  end
  def all_signed_out?
    users = Devise.mappings.keys.map { |s| warden.user(scope: s, run_callbacks: false) } 
    users.all?(&:blank?)
  end
  def respond_to_on_destroy 
    respond_to do |format|
      format.all { head :no_content }
      format.any(*navigational_formats) { redirect_to after_sign_out_path_for(resource_name) }
    end
  end  
  def termoUsoLibera
    User.find(params[:id]).update(termo_de_uso: true) 
    redirect_to root_path 
  end
  private
  def set_login_token 
    current_user.aux_cartorio_id = params[:intranet_cartorio_id]
    token = Devise.friendly_token
    session[:login_token] = token
    current_user.current_login_token = token
    current_user.save
  end
end
