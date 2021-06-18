# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
    before_action :configure_sign_up_params, only: [:create]
    before_action :configure_account_update_params, only: [:update] 
	require './lib/generate_pdf'
    def new  
		@cartorios = Intranet::Cartorio.all.order(:intranet_cidade_id)
		@cartorios.each do |cart|
			@cidade = Intranet::Cidade.find_by_id(cart.intranet_cidade_id)
			cart.nome = "#{@cidade.municipio} - #{cart.nome_res}"
		end
      	super  
    end 
    def create
		@cartorios = Intranet::Cartorio.all.order(:intranet_cidade_id)
		@cartorios.each do |cart|
			@cidade = Intranet::Cidade.find_by_id(cart.intranet_cidade_id)
			cart.nome = "#{@cidade.municipio} - #{cart.nome_res}"
		end  
		if params[:intranet_cartorio_id] != '' 
			@cart = Intranet::Cartorio.find_by_id(params[:intranet_cartorio_id])
			params[:user][:serventia] = @cart.cod_tj
		end
      	super  
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
	def emailcheck
		@user = User.search(params[:email])
		respond_to do |format|
		  format.json {render :json => {email_exists: @user.present?}} #sir Deep suggestion to return true or false for email_exists or the code below
		 # format.json {render :json => @user}
		end
	end 

	def valida_doc(doc_name)
		@images      = ['jpeg','jpg','png','bwp']
		@xml         = ['xml']
		@pdf         = ['pdf']
		@word        = ['doc']
		@doc_name 	= doc_name
		@doc_name 	= @doc_name.split('.')
		@doc_name 	= @doc_name[@doc_name.length - 1]
		if @doc_name == @images[0] or @doc_name == @images[1] or @doc_name == @images[2] or @doc_name == @images[3]
		  @doc_name = "image/#{@doc_name}"
		elsif @doc_name == @xml[0]
		  @doc_name = "application/xml"
		elsif @doc_name == @pdf[0]
		  @doc_name = "application/pdf"
		else @doc_name == @word[0]
		  @doc_name = "application/msword" 
		end
		return @doc_name
	end
	
	def confirmarcad 
		@user_id = params[:id] 
		@user      	= User.find(@user_id)
		@addfixa = true 
		if params[:fixa_assinada]
			@user      	= User.find(@user_id)
			@associado 	= Intranet::Associado.try(:where, user_id: @user.id)
			@user.fixa_assinada.attach(params[:fixa_assinada]) 
			UserMailer.criado_com_sucesso(@user).deliver_later
			UserMailer.criado_com_sucesso_popup(@user).deliver_later 
			redirect_to user_session_path
		end
	end
	def geratermofiliacao
		user_d  	= User.find(params[:id])
		associado_d = Intranet::Associado.where(user_id: user_d.id).take
		cartorio_d  = Intranet::Cartorio.find(associado_d.intranet_cartorio_id)
		cidade_d    = Intranet::Cidade.find(cartorio_d.intranet_cidade_id) 
		GeneratePdf::run_pdf(user_d,associado_d,cartorio_d,cidade_d)
		redirect_to "/termo_filiacao.pdf"
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
      	devise_parameter_sanitizer.permit(:sign_up, keys: [:fixa_assinada,:termo_posse, :rg_photo_1, :rg_photo_2, :cpf_photo, :serventia,:nome, :email, :password, :password_confirmation,:cpf, :lembrete,  :intranet_cidade_id, :intranet_matricula, :intranet_data_nascimento, :intranet_funcao, :intranet_rg, :intranet_sexo, :intranet_ativo, :intranet_cep, :intranet_logradouro, :intranet_complemento, :intranet_bairro, :intranet_telefone_1, :intranet_telefone_2, :intranet_celular, :intranet_whatsapp, :intranet_email])
    end
    def configure_account_update_params
      	devise_parameter_sanitizer.permit(:sign_up, keys: [:fixa_assinada,:termo_posse, :rg_photo_1, :rg_photo_2, :cpf_photo, :serventia,:nome, :email, :password, :password_confirmation,:cpf, :lembrete])
    end
    def after_sign_up_path_for(resource)
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
				user_path(id: @user.id)
			else 
				User.delete(@user.id) 
				super(resource) 
				flash.delete(:notice)
				flash[:success] = "Ops! Algum problema aconteceu, tente se cadastrar novamente em algumas minutos."
			end
		end 
	end
    def after_inactive_sign_up_path_for(resource)
      	super(resource)
    end
end
