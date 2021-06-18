class Intranet::Avisos::DispararEmailAvisoJob < ApplicationJob
  queue_as :default

	def perform(intranet_aviso)
		@cartorios = Intranet::Cartorio.all
		@count == 1
		puts "---------------------------"
		puts "Referencia: " + (intranet_aviso.intranet_atividade_id).to_s
		@cartorios.each do |cartorio|
			if cartorio.intranet_atividade_id & intranet_aviso.intranet_atividade_id
				@assoc 	= Intranet::Associado.where(intranet_cartorio_id: cartorio.id,ativo: true).take
				begin 
					@avs_slave = Intranet::Aviso.new(	titulo: 				intranet_aviso.titulo, 
														descricao: 				intranet_aviso.descricao, 
														intranet_atividade_id: 	intranet_aviso.intranet_atividade_id, 
														integer_id: 			intranet_aviso.integer_id, 
														ativo: 					intranet_aviso.ativo, 
														recipient_id: 			@assoc.user_id,
														master_id:              intranet_aviso.id)
					@avs_slave.save
					@avs 	= Intranet::Aviso.find(intranet_aviso.id)  
					@avs.recipient_id = @assoc.user_id
					@avs.save
				rescue
					puts "cart_id: " + cartorio.id.to_s + " sem associados"
				end   
				puts "----- Cartorio id: " + (cartorio.id).to_s 
				#AdminMailer.aviso_new(cartorio,intranet_aviso).deliver_later 
			end  
		end 
	end
end
#carts sem atvs [50, 144, 190, 191, 193, 196, 198, 200, 203, 206, 208, 212, 218, 235, 357, 474, 630, 631] 