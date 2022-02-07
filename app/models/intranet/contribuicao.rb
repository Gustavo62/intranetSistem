class Intranet::Contribuicao < ApplicationRecord
    def self.consulta_por_status(status)
        if status.present?
            where(ativo: status)
        else
            all
        end
    end
end
