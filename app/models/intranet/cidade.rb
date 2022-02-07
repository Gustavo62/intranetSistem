class Intranet::Cidade < ApplicationRecord
    def self.pesquisa_cidade(cidad_params)
        if cidad_params.present?  
          where(id: cidad_params) 
        else
          all
        end
      end
end
