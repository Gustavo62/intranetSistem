class Intranet::Event < ApplicationRecord 
  has_rich_text :mensagem
  def self.pesquisa_status(status)
    if status.present?
      if status == '0'
        where.not(valor: 0)
      else
        where(valor: 0)
      end
    else
      all
    end
  end
end
