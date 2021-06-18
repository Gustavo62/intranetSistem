class Intranet::Avisos::ExcluirLoteAvisoJob < ApplicationJob
  queue_as :default

  def perform(intranet_aviso)
		@intranet_avisos = Intranet::Aviso.where(master_id: intranet_aviso.id,master: false)
		puts @intranet_avisos.size
		@intranet_avisos.each do |aviso| 
			aviso.destroy
		end
	end
end
