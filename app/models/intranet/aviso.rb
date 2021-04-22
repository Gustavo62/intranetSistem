class Intranet::Aviso < ApplicationRecord
    validates :descricao, :atividade_id, presence: true
end
