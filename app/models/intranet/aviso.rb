class Intranet::Aviso < ApplicationRecord 
    has_rich_text :aviso
    has_many :atividade 
	has_many_attached :docs
    def self.pesquisa(status)
        if status.present?  
            where(ativo: status) 
        else
            all
        end 
    end
end
