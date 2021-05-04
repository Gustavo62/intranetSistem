# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
    before_action :configure_sign_up_params, only: [:create]
    before_action :configure_account_update_params, only: [:update]
    def new  
		@cartorios = Intranet::Cartorio.all
		@cartorios.each do |cart|
			@cidade = Intranet::Cidade.find_by_id(cart.intranet_cidade_id)
			cart.nome = "#{@cidade.municipio} - #{cart.nome_res}"
		end
      	super  
    end 
    def create
		@cartorios = Intranet::Cartorio.all
		@cartorios.each do |cart|
			@cidade = Intranet::Cidade.find_by_id(cart.intranet_cidade_id)
			cart.nome = "#{@cidade.municipio} - #{cart.nome_res}"
		end  
		if params[:intranet_cartorio_id] != nil 
			@cart = Intranet::Cartorio.find_by_id(params[:intranet_cartorio_id])
			params[:user][:serventia] = @cart.cod_tj
		end
      	super 
		if @user.save  
			@cep = BuscaEndereco.cep(params[:intranet_cep]) 			if params[:intranet_cep] != ''
			@user_id          = @user.id
			@cartorio_id      = params[:intranet_cartorio_id] 			if params[:intranet_cartorio_id] != ''
			@matricula        = params[:intranet_matricula] 			if params[:intranet_matricula] != ''
			@data_nascimento  = params[:intranet_data_nascimento] 		if params[:intranintranet_data_nascimentoet_cep] != ''
			@funcao           = params[:intranet_funcao] 				if params[:intranet_funcao] != ''
			@rg               = params[:intranet_rg] 					if params[:intranet_rg] != ''
			@rg_emissor       = params[:intranet_rg_emissor] 			if params[:intranet_rg_emissor] != ''
			@sexo             = params[:intranet_sexo] 					if params[:intranet_ativo] != ''
			@ativo            = params[:intranet_ativo] 				if params[:intranet_ativo] != ''
			@cep              = params[:intranet_cep]					if params[:intranet_cep] != ''
			@logradouro       = params[:intranet_logradouro]			if params[:intranet_logradouro] != ''
			@complemento      = params[:intranet_complemento] 			if params[:intranet_complemento] != ''
			@bairro           = params[:intranet_bairro]				if params[:intranet_bairro] != ''
			@telefone_1       = params[:intranet_telefone_1]			if params[:intranet_telefone_1] != ''
			@telefone_2       = params[:intranet_telefone_2]			if params[:intranet_telefone_2] != ''
			@celular          = params[:intranet_celular] 				if params[:intranet_celular] != ''
			@whatsapp         = params[:intranet_whatsapp] 				if params[:intranet_whatsapp] != ''
			@email            = params[:intranet_email]  				if params[:intranet_email] != ''
			@nome	          = params[:intranet_nome]  				if params[:intranet_nome] != ''
			@paramsAss = {user_id:	@user_id,
			matricula:				@matricula, 
			data_nascimento:		@data_nascimento, 
			funcao:					@funcao, 
			nome:					@nome, 
			rg:						@rg, 
			rg_emissor:				@rg_emissor, 
			sexo:					@sexo, 
			ativo:					@ativo,
			cep:					@cep, 
			logradouro:				@logradouro,
			complemento:			@complemento, 
			bairro:					@bairro,
			telefone_1:				@telefone_1, 
			telefone_2:				@telefone_2, 
			celular:				@celular,
			whatsapp:				@whatsapp,
			email:					@email, 
			intranet_cartorio_id:	@cartorio_id}
			@result = criar_associado(@paramsAss)
			if @result 
				flash.delete(:notice)
				flash[:success] = "Olá Conta criada com sucesso aguarde um email com a ativação do seu ambiente!"
			else 
				User.delete(@user.id) 
				flash.delete(:notice)
				flash[:success] = "Ops! Algum problema aconteceu, tente se cadastrar novamente em algumas minutos."
			end
		end
    end 
	def edit
		@cart_current = Intranet::Cartorio.where(cod_tj: current_user.serventia).take
		current_user.nome = first_name(current_user.nome)
		@cid_current  = Intranet::Cidade.where(id: @cart_current.intranet_cidade_id).take
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
	
	  
    def criar_associado(parameters)
		@intranet_associado = Intranet::Associado.new(parameters) 
		@intranet_associado.save 
		if @intranet_associado.save
			return true
		else  
			return false
		end 
    end
    def configure_sign_up_params
      	devise_parameter_sanitizer.permit(:sign_up, keys: [:serventia,:nome, :email, :password, :password_confirmation,:cpf, :lembrete,  :intranet_cidade_id, :intranet_matricula, :intranet_data_nascimento, :intranet_funcao, :intranet_rg, :intranet_sexo, :intranet_ativo, :intranet_cep, :intranet_logradouro, :intranet_complemento, :intranet_bairro, :intranet_telefone_1, :intranet_telefone_2, :intranet_celular, :intranet_whatsapp, :intranet_email])
    end
    def configure_account_update_params
      	devise_parameter_sanitizer.permit(:sign_up, keys: [:serventia,:nome, :email, :password, :password_confirmation,:cpf, :lembrete])
    end
    def after_sign_up_path_for(resource)
      	super(resource)
    end
    def after_inactive_sign_up_path_for(resource)
      	super(resource)
    end
end
