class UsuarioController < ApplicationController 
	before_action :authenticate_user!, :valida_acesso 
	$user = true
	def home  
		@aviso = Intranet::Aviso.where(ativo: true, recipient_id: current_user.id,master: false).order(:created_at)

		@avisonumb = Intranet::Aviso.where(ativo: true, recipient_id: current_user.id, read_at: nil,master: false).order(:created_at)
		if @avisonumb.size > 0
		@numero_pushs = 0 
		@numero_pushs += @avisonumb.size
		flash[:notice] = "Você tem que ainda não foram visualizados!" 
		end
	end  
end
