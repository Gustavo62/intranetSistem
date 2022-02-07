class Intranet::Substituto < ApplicationRecord
    def self.consulta_por_cartorio_id(cartorio_id)
        if cartorio_id.present? 
            where(cart_ref_id: cartorio_id)
        else
            all
        end
    end
    def self.consulta_por_atual(atual)
        if atual.present? 
            where(atual?: atual)
        else
            all
        end
    end
end
