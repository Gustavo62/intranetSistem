# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
    before_action :configure_sign_up_params, only: [:create]
    before_action :configure_account_update_params, only: [:update]
    def new  
		@cidades = Intranet::Cidade.all
      	super  
    end 
    def create   
      	super 
		if @user.save 
			@user_id          = @user.id
			@cidade_id        = params[:intranet_cidade_id]
			@matricula        = params[:intranet_matricula]
			@data_nascimento  = params[:intranet_data_nascimento]
			@funcao           = params[:intranet_funcao]
			@rg               = params[:intranet_rg]
			@sexo             = params[:intranet_sexo]
			@ativo            = params[:intranet_ativo]
			@cep              = params[:intranet_cep]
			@logradouro       = params[:intranet_logradouro]
			@complemento      = params[:intranet_complemento]
			@bairro           = params[:intranet_bairro]
			@telefone_1       = params[:intranet_telefone_1]
			@telefone_2       = params[:intranet_telefone_2]
			@celular          = params[:intranet_celular]
			@whatsapp         = params[:intranet_whatsapp]
			@email            = params[:intranet_email] 
			criar_associado
		end
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
	
	  
    def criar_associado
		@intranet_associado = Intranet::Associado.new(:user_id => @user_id,:intranet_cidade_id => @cidade_id)
		@intranet_associado.save 
    end
    def configure_sign_up_params
      	devise_parameter_sanitizer.permit(:sign_up, keys: [:nome, :email, :password, :password_confirmation,:cpf, :lembrete,  :intranet_cidade_id, :intranet_matricula, :intranet_data_nascimento, :intranet_funcao, :intranet_rg, :intranet_sexo, :intranet_ativo, :intranet_cep, :intranet_logradouro, :intranet_complemento, :intranet_bairro, :intranet_telefone_1, :intranet_telefone_2, :intranet_celular, :intranet_whatsapp, :intranet_email])
    end
    def configure_account_update_params
      	devise_parameter_sanitizer.permit(:sign_up, keys: [:nome, :email, :password, :password_confirmation,:cpf, :lembrete])
    end
    def after_sign_up_path_for(resource)
      	super(resource)
    end
    def after_inactive_sign_up_path_for(resource)
      	super(resource)
    end
end
