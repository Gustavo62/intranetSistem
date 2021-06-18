class Intranet::Avisos::AtualizarMsgJob < ApplicationJob
	queue_as :default

	def perform(intranet_aviso)
		@intranet_avisos = Intranet::Aviso.where(master_id: intranet_aviso.id,master: false)
		puts @intranet_avisos.size
		@intranet_avisos.each do |aviso| 
			aviso.titulo 				= intranet_aviso.titulo 				if aviso.titulo 				!= intranet_aviso.titulo
			aviso.descricao 			= intranet_aviso.descricao				if aviso.descricao 				!= intranet_aviso.descricao
			aviso.aviso					= intranet_aviso.aviso					if aviso.aviso					!= intranet_aviso.aviso
			aviso.intranet_atividade_id = intranet_aviso.intranet_atividade_id	if aviso.intranet_atividade_id 	!= intranet_aviso.intranet_atividade_id
			aviso.ativo					= intranet_aviso.ativo					if aviso.ativo 					!= intranet_aviso.ativo 
			aviso.save
		end
	end
end
