class Intranet::Aviso < ApplicationRecord 
    has_rich_text :aviso
    has_many :intranet_atividade 
	has_many_attached :docs
end
