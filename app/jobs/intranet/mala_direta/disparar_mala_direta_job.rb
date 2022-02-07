class Intranet::MalaDireta::DispararMalaDiretaJob < ApplicationJob
  queue_as :default

  def perform(id_mala_direta)
		@cartorios = Intranet::Cartorio.all
    @mala_direta  = Intranet::MalaDiretum.find(id_mala_direta) 
    if (@mala_direta.intranet_cartorio_id & ["0"]).any? 
      @cartorios.each do |cartorio|   
        AdminMailer.maladireta(cartorio.email,id_mala_direta).deliver_later  
      end 
    else
      @cartorios.each do |cartorio|  
        if (@mala_direta.intranet_cartorio_id & [cartorio.id.to_s]).any?
          AdminMailer.maladireta(cartorio.email,id_mala_direta).deliver_later 
        end  
      end 
    end
	end
end
