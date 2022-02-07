class Intranet::Avisos::DispararEmailAvisoJob < ApplicationJob
  	queue_as :default

	def perform(intranet_aviso)
		@cartorios = Intranet::Cartorio.all
		@count == 1  
		@cartorios.each do |cartorio|
			aux = cartorio.intranet_atividade_id & intranet_aviso.intranet_atividade_id
			puts "Aviso para user, Referencias: aviso_id - " + (intranet_aviso.intranet_atividade_id).to_s + " / cart_id " + (cartorio.id).to_s
			if aux.any?
				@assoc 	     = Intranet::Associado.where(ativo: true).where("intranet_cartorio @> ?", "{#{cartorio.id}}").take
				if @assoc
					@aviso_exist = Intranet::Aviso.where(master_id: intranet_aviso.id,recipient_id: @assoc.user_id).size
				end
				if @assoc && @aviso_exist == 0 
					begin 
						@avs_slave = Intranet::Aviso.new(	titulo: 				intranet_aviso.titulo, 
															descricao: 				intranet_aviso.descricao, 
															intranet_atividade_id: 	intranet_aviso.intranet_atividade_id, 
															integer_id: 			intranet_aviso.integer_id, 
															ativo: 					intranet_aviso.ativo,  
															recipient_id: 			@assoc.user_id,
															master_id:              intranet_aviso.id) 
						@avs_slave.save
						ActionText::RichText.create!(name:'aviso',body: intranet_aviso.aviso.body ,record_type: "Intranet::Aviso", record_id: @avs_slave.id )
						if intranet_aviso.docs 
							intranet_aviso.docs.each do |documents|
								@avs_slave.docs.attach(documents.blob)
							end  
						end    
					rescue
						puts "cart_id: " + cartorio.id.to_s + " sem associados"
					end    
					AdminMailer.aviso_new('gust904@gmail.com',intranet_aviso).deliver_later 
				end
			end   
			break 
		end 
	end
end 