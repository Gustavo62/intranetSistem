class Intranet::Arquivo < ApplicationRecord
  has_one :arquivos_tipo
  has_many :cartorios 
  has_many_attached :arquivos 
  def self.consulta_por_status(status)
    if status.present?
        where(ativo: status)
    else
        all
    end
end
end
