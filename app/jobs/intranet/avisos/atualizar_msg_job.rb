class Intranet::Avisos::AtualizarMsgJob < ApplicationJob
	queue_as :default

	def perform(avs)
		@intranet_avisos = Intranet::Aviso.where(master_id: avs.id,master: false)
		@intranet_avisos.each do |aviso| 
			aviso.titulo 				= avs.titulo 				
			aviso.descricao 			= avs.descricao				
			aviso.aviso					= avs.aviso					
			aviso.intranet_atividade_id = avs.intranet_atividade_id	
			aviso.ativo					= avs.ativo	 		
			aviso.aviso.body 			= avs.aviso.body 		
			aviso.save
		end  
		
	end
end
