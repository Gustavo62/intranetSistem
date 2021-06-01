class Intranet::ListaUsuariosController < ApplicationController 
	def index 
		@users       = User.where(acesso: false)
		@associados  = Intranet::Associado.where(user_id: @users.map(&:id))
		@cartorios   = Intranet::Cartorio.where(id: @associados.map(&:intranet_cartorio_id))  
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
			@msg 			= "Seu cadastro feito com sucesso, seu acesso foi liberado, fique a vontade para assistir o sistema."
			@assunto     	= "Cadaatro efetuado com sucesso"
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
			@associado.delete
			@user.delete
			redirect_to intranet_lista_usuarios_index_path(indeferido: true)
		end 
	end 
	def visualizar
		if params[:id]
			@user_id_def 	= params[:id]  
			@user	 		= User.find(@user_id_def)  
			@associado      = Intranet::Associado.where(user_id: @user.id).take
			@cartorio       = Intranet::Cartorio.find(@associado.intranet_cartorio_id)
			@cidade         = Intranet::Cidade.find(@cartorio.intranet_cidade_id) 
			url_for(@user.fixa_assinada)
		end
	end
	def msg_deferido
		flash.now[:success] = "Foi liberado o acesso do usuario numero" 
	end 
end
