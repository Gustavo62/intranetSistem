# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
    before_action :configure_sign_up_params, only: [:create]
    before_action :configure_account_update_params, only: [:update]  
	before_action :valida_acesso, only: [ :edit,:new,:create ]
	skip_before_action :verify_authenticity_token, :only => [:index, :show, :anexaDocFiliacao]
	require './lib/generate_pdf'
    def new   
		if admin_signed_in?
			administrador_home_path
		else 
			if user_signed_in?
				usuario_home_path
			end
		end
		@cartorios = Intranet::Cartorio.all.order(:intranet_cidade_id)
		@cartorios.each do |cart|
			@cidade = Intranet::Cidade.find_by_id(cart.intranet_cidade_id)
			cart.nome = "#{@cidade.municipio} - #{cart.nome}"
		end
      	super  
    end 
    def create 
		@cartorios = Intranet::Cartorio.all.order(:intranet_cidade_id)
		@cartorios.each do |cart|
			@cidade = Intranet::Cidade.find_by_id(cart.intranet_cidade_id)
			cart.nome = "#{@cidade.municipio} - #{cart.nome}"
		end    
		if current_admin 
			cria_user()
		else  
			super
		end
    end 
	def edit  
		@cart_current = Intranet::Cartorio.where(id: current_user.aux_cartorio_id).take 
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
		@user_id    = params[:id] || params[:format]
		@user      	= User.where(id: @user_id).take
		if @user 
			@associado 	  = Intranet::Associado.where(user_id: @user.id).take
			@cartorio  	  = Intranet::Cartorio.find(@associado.try(:intranet_cartorio)) 
			@situacaoFixa = Intranet::FixaFiliacao.verificaFicha(@user.id)
		else
			flash.delete(:notice)
			flash[:info] = "Houve um problema tente novamente em alguns instantes."
			redirect_to root_path
		end
	end
	def anexaDocFiliacao 
		@user_id    = params[:id] 
		@user      	= User.where(id: @user_id).take
		@associado  = Intranet::Associado.where(user_id: @user.try(:id)).take
		if @user  == nil
			redirect_to root_path
		else   
			@associado.intranet_cartorio.each do | cart_id |   
				@ficha    = Intranet::FixaFiliacao.create(ativo: true,user_id: @user.id, intranet_associado_id: @associado.id, intranet_cartorio_id: cart_id, fixa_assinada: params[:"fixa_assinada_#{cart_id}"]) 
				puts @ficha.errors.full_messages
			end
			@associado.intranet_cartorio.each do | cart_id |   
				@fixa    = Intranet::FixaFiliacao.where(ativo: true,user_id: @user.id, intranet_associado_id: @associado.id, intranet_cartorio_id: cart_id).take
				if @termo
					@termo.termo_posse.attach(params[:"fixa_assinada_#{cart_id}"])
				else
					@termo = Intranet::TermoPosse.create(ativo: true,user_id: @user.id, intranet_associado_id: @associado.id, intranet_cartorio_id: cart_id) 
					@termo.termo_posse.attach(params[:"fixa_assinada_#{cart_id}"])
				end
			end
			if @ficha.save
				UserMailer.criado_com_sucesso(@user).deliver_later
				UserMailer.criado_com_sucesso_popup(@user).deliver_later 
				if current_admin
					redirect_to intranet_associado_path(@associado)
				else
					redirect_to user_session_path
					link =  "<a href=\"http://www.anoregce.org.br/\">aqui</a>" 
					flash.delete(:notice)
					flash[:info] = "Seus documentos foram anexados porem seu acesso ainda não foi liberado, aguarde a liberação ou entre em contato com a Anoreg, para falar conosco clique #{link}."
				end 
			else	
				flash[:danger] = "Erro ao anexar os documentos."
				redirect_to user_path(id: @user.id)
			end
		end
	end
	def geratermofiliacao
		user_d  	= User.find(params[:id])
		associado_d = Intranet::Associado.where(user_id: user_d.id).take
		cartorio_d  = Intranet::Cartorio.find(params[:cartorio_id])
		cidade_d    = Intranet::Cidade.find(cartorio_d.intranet_cidade_id) 
		GeneratePdf::run_pdf(user_d,associado_d,cartorio_d,cidade_d)
		redirect_to "/termo_filiacao_#{params[:cartorio_id]}.pdf"
	end
	def consulta_user
		@response_user = User.where(cpf: params[:cpf])
		
		respond_to do |format| 
		  format.json { render json: @response_user.size }
		end 
	end 
	def verificaDadosCart  
		if(params[:ids] != "")
			@response_cart = Intranet::Cartorio.find(params[:ids].split(',')) 
			respond_to do |format| 
			  format.json { render json: @response_cart.pluck(:cnpj,:nome, :nome_fant, :telefone_celular,:telefone_fixo,:logradouro,:cod_cns,:cod_tj,:email,:id) }
			end 
		end
	end
	protected
	
	 
    def configure_sign_up_params
      	devise_parameter_sanitizer.permit(:sign_up, keys: [ :rg_photo_1, :rg_photo_2, :cpf_photo, :cartorio_id,:nome, :email, :password, :password_confirmation,:cpf, :lembrete,  :intranet_cidade_id, :intranet_matricula, :intranet_data_nascimento, :intranet_funcao, :intranet_rg, :intranet_sexo, :intranet_ativo, :intranet_cep, :intranet_logradouro, :intranet_complemento, :intranet_bairro, :intranet_telefone_1, :intranet_telefone_2, :intranet_celular, :intranet_whatsapp, :intranet_email])
    end
    def configure_account_update_params
      	devise_parameter_sanitizer.permit(:sign_up, keys: [:rg_photo_1, :rg_photo_2, :cpf_photo ,:nome, :email, :password, :password_confirmation,:cpf, :lembrete])
    end 
    def first_name(name)
		if name.split.count > 1
		  name.split[0..1].join(' ')
		else
		  name
		end
	  end
	def cria_user
		@cart = Intranet::Cartorio.find_by_id(params[:intranet_cartorio_id])  
		@user = User.new(:nome => params[:user][:nome],:email => params[:user][:email],:cpf => params[:user][:cpf], :password => params[:user][:password], :password_confirmation => params[:user][:password_confirmation])
		if @user.save 
			@user_id          = @user.id
			@cartorio_id      = params[:intranet_cartorio]				if params[:intranet_cartorio] != '' 
			@data_nascimento  = params[:intranet_data_nascimento] 		if params[:intranet_data_nascimentoet_cep] != ''
			@substituto       = params[:intranet_substituto]  			if params[:intranet_substituto] != ''
			@funcao           = params[:intranet_funcao] 				if params[:intranet_funcao] != ''   
			@cep              = params[:intranet_cep]					if params[:intranet_cep] != ''
			@logradouro       = params[:intranet_logradouro]			if params[:intranet_logradouro] != ''
			@complemento      = params[:intranet_complemento] 			if params[:intranet_complemento] != ''
			@bairro           = params[:intranet_bairro]				if params[:intranet_bairro] != ''
			@telefone_1       = params[:intranet_telefone_1]			if params[:intranet_telefone_1] != ''
			@telefone_2       = params[:intranet_telefone_2]			if params[:intranet_telefone_2] != ''
			@celular          = params[:intranet_celular] 				if params[:intranet_celular] != ''
			@whatsapp         = params[:intranet_whatsapp] 				if params[:intranet_whatsapp] != ''
			@email            = params[:intranet_email]  				if params[:intranet_email] != ''
			@nome	          = @user.nome  							
			@paramsAss = {user_id:	@user_id, 
			data_nascimento:		@data_nascimento, 
			funcao:					@funcao, 
			nome:					@nome,   
			cep:					@cep, 
			logradouro:				@logradouro,
			complemento:			@complemento, 
			bairro:					@bairro,
			telefone_1:				@telefone_1, 
			telefone_2:				@telefone_2, 
			celular:				@celular,
			substituto:				@substituto,
			whatsapp:				@whatsapp,
			email:					@email, 
			intranet_cartorio:		@cartorio_id}
			@associado = Intranet::Associado.new(@paramsAss) 
			if @associado.save 
				@associado.intranet_cartorio.each do | cart_id |  
					Intranet::Cartorio.find(cart_id).update(intranet_associado_id: @associado.id)
					@termo    = Intranet::TermoPosse.create(ativo: true,user_id: @user.id, intranet_associado_id: @associado.id, intranet_cartorio_id: cart_id, termo_posse: params[:"termo_posse_#{cart_id}"]) 
				end
				if current_admin
					redirect_to intranet_associado_path(@associado)
				end 
			else
				User.destroy(@user.id)   
				flash[:success] = "Ops! Algum problema aconteceu, tente se cadastrar novamente em algumas minutos."
			end 
		else 
			flash[:success] = "Ops! Algum problema aconteceu, tente se cadastrar novamente em algumas minutos."
		end 
	end
    def after_sign_up_path_for(resource)
		if @user.save    
			#@cep = BuscaEndereco.cep(params[:intranet_cep]) 			if params[:intranet_cep] != ''
			begin 
				@user_id          = @user.id
				@cartorio_id      = params[:intranet_cartorio]      	if params[:intranet_cartorio] != '' 
				@data_nascimento  = params[:intranet_data_nascimento] 	if params[:intranet_data_nascimentoet_cep] != ''
				@substituto       = params[:intranet_substituto]  		if params[:intranet_substituto] != ''
				@funcao           = params[:intranet_funcao] 			if params[:intranet_funcao] != ''   
				@cep              = params[:intranet_cep]				if params[:intranet_cep] != ''
				@logradouro       = params[:intranet_logradouro]		if params[:intranet_logradouro] != ''
				@complemento      = params[:intranet_complemento] 		if params[:intranet_complemento] != ''
				@bairro           = params[:intranet_bairro]			if params[:intranet_bairro] != ''
				@telefone_1       = params[:intranet_telefone_1]		if params[:intranet_telefone_1] != ''
				@telefone_2       = params[:intranet_telefone_2]		if params[:intranet_telefone_2] != ''
				@celular          = params[:intranet_celular] 			if params[:intranet_celular] != ''
				@whatsapp         = params[:intranet_whatsapp] 			if params[:intranet_whatsapp] != ''
				@email            = params[:intranet_email]  			if params[:intranet_email] != ''
				@nome	          = @user.nome  		
									
				@paramsAss = {user_id:	@user_id, 
				data_nascimento:		@data_nascimento, 
				funcao:					@funcao, 
				nome:					@nome,   
				cep:					@cep, 
				logradouro:				@logradouro,
				complemento:			@complemento, 
				bairro:					@bairro,
				telefone_1:				@telefone_1, 
				telefone_2:				@telefone_2, 
				celular:				@celular,
				substituto:				@substituto,
				whatsapp:				@whatsapp,
				email:					@email, 
				intranet_cartorio:	@cartorio_id}
				@associado = Intranet::Associado.new(@paramsAss)  
				if @associado.save 
					@associado.intranet_cartorio.each do | cart_id |  
						Intranet::Cartorio.find(cart_id).update(intranet_associado_id: @associado.id)
						@termo    = Intranet::TermoPosse.create(ativo: true,user_id: @user.id, intranet_associado_id: @associado.id, intranet_cartorio_id: cart_id, termo_posse: params[:user][:"termo_posse_#{cart_id}"]) 
					end   
					return @user
				else
					User.destroy(@user.id) 
					super(resource) 
					flash.delete(:notice)
					flash[:success] = "Erro segundo begin | Ops! Algum problema aconteceu, tente se cadastrar novamente em algumas minutos." 
					redirect_to root_path
				end  
			rescue  
				User.destroy(@user.id) 
				super(resource) 
				flash.delete(:notice)
				flash[:success] = "Erro primeiro begin | Ops! Algum problema aconteceu, tente se cadastrar novamente em algumas minutos." 
				return false
			end
		end 
	end
    def after_inactive_sign_up_path_for(resource)
      	super(resource)
    end
end
