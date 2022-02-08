class Intranet::FixaFiliacao < ApplicationRecord
	has_one_attached :fixa_assinada 
	
	def self.verificaFicha(user_id)
		@fixas_encontradas = 0
		@associado = Intranet::Associado.where(user_id: user_id).take
		@associado.intranet_cartorio.each do | cart_id | 
		  @fichas    = Intranet::FixaFiliacao.where(ativo: true,user_id: user_id, intranet_associado_id: @associado.id, intranet_cartorio_id: cart_id) 
		  if @fichas.size != 0  
			@fixas_encontradas += 1
		  end
		end  
		if @fixas_encontradas == 0 && @associado.intranet_cartorio.size < @fixas_encontradas == false
		  return false
		else
		  return true
		end
	end
end
