class Intranet::Cartorio < ApplicationRecord
  belongs_to :regiao
  belongs_to :contribuicao
  belongs_to :atividade
  belongs_to :entrancia
  belongs_to :boleto
  belongs_to :cidade
  belongs_to :associado
  belongs_to :substituto
  belongs_to :tabeliaes
end
