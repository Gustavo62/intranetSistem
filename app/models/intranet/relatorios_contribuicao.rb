class Intranet::RelatoriosContribuicao < ApplicationRecord
    def self.consulta_por_data(data) 
        if data.present? 
            where('extract(year  from data) = ?', data.first(4)).where('extract(month from data) = ?', data.last(2))
        else
            all
        end
    end
    def self.consulta_por_status(status)
        
        if status.present? 
            where(status: status)
        else
            all
        end
    end
end
