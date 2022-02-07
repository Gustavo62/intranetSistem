class Intranet::ListaUsuariosController < ApplicationController 
	before_action :valida_acesso  
  	authorize_resource :class => false
	def index 
		@users       = User.where(acesso: false)
		@associados  = Intranet::Associado.where(user_id: @users.map(&:id))
		@intranet_associados_ids = []
		@associados.pluck(:intranet_cartorio).each do | assoc_id |
			if(assoc_id.size != 0)
				assoc_id.each do | id |
					@intranet_associados_ids << id
				end
			else
				@intranet_associados_ids << assoc_id
			end
		end
		@intranet_associados_ids    = @intranet_associados_ids.uniq 
		@cartorios   = Intranet::Cartorio.where(id: @intranet_associados_ids)  
		@cidades     = Intranet::Cidade.where(id: @cartorios.map(&:intranet_cidade_id))
		if params[:indeferido]
			flash[:success] = "Foi enviada a mensagem para o usuário, e excluido o cadastro pendente."  
		end
		if params[:deferido]
			flash[:success] = "Foi liberado o acesso do usuário."  
		end
	end
	def deferir 
		if params[:id] != nil
			@user_id	= params[:id]  
		end 
		if params[:status] == 'liberado' 
			@user	 		= User.find(params[:user_id])
			@user.acesso  	= true
			@user.save    
			@msg 			= "Seu cadastro feito com sucesso, seu acesso foi liberado, fique a vontade para acessar o sistema."
			@assunto     	= "Cadastro efetuado com sucesso"
			AdminMailer.cad_deferido(@user,@assunto,@msg).deliver_later 
			redirect_to intranet_lista_usuarios_index_path(deferido: true)
		end  
	end 
	def indeferir
		if params[:id] != nil
			@user_id 		= params[:id] 
		end
		if params[:assunto] 
			@user	 		= User.find(params[:user_id])  
			AdminMailer.cad_indeferido(@user,params[:assunto],params[:mensagem]).deliver_later 
			@associado = Intranet::Associado.where(user_id: @user.id).take 
			@user.destroy
			redirect_to intranet_lista_usuarios_index_path(indeferido: true)
		end 
	end 
	def visualizar
		if params[:id]
			@user_id_def 	= params[:id]  
			@user	 		= User.find(@user_id_def)  
			@associado      = Intranet::Associado.where(user_id: @user.id).take
			@intranet_associados_ids = [] 
			@intranet_associados_ids    = @intranet_associados_ids.uniq 
			@cartorio       = Intranet::Cartorio.all.find(@associado.intranet_cartorio) 
			@cartorios      = Intranet::Cartorio.all
			@cidade         = Intranet::Cidade.find(@cartorio.pluck(:intranet_cidade_id))  
			@fixas = Intranet::FixaFiliacao.where(ativo: true,user_id: @user.id, intranet_associado_id: @associado.id, intranet_cartorio_id: @associado.intranet_cartorio)
			@termos = Intranet::TermoPosse.where(ativo: true,user_id: @user.id, intranet_associado_id: @associado.id, intranet_cartorio_id: @associado.intranet_cartorio)
		end
	end
	def msg_deferido
		flash.now[:success] = "Foi liberado o acesso do usuario numero" 
	end 
end
