class Intranet::Cartorio < ApplicationRecord 
  has_one :substituto, dependent: :destroy
  has_one :tabeliao, dependent: :nullify
  has_one :cidade, dependent: :destroy
  has_many :associados, dependent: :destroy
  has_many :regiao, dependent: :destroy
  has_many :atividades, dependent: :destroy
  has_many :contribuicao, dependent: :destroy
  has_many :entrancium, dependent: :destroy
  def self.pesquisa_cart_serv(intranet_cartorio_id)
      if intranet_cartorio_id.present?  
        where(id: intranet_cartorio_id) 
      else
        all
      end
  end  
  def self.pesquisa_situacao_adimp(adimplente)
    if adimplente.present?  
      where(adimplente: adimplente)
    else
      all
    end
  end
  def self.pesquisa_cart_id(id)
    if id.present?  
      where(id: id) 
    else
      all
    end
  end 
  def self.pesquisa_cart_status(status)
    if status.present?  
      where(ativo: status) 
    else
      all
    end
  end
  def self.pesquisa_cart_cidade_id(id)
    if id.present?  
      where(intranet_cidade_id: id) 
    else
      all
    end
  end
  def self.consulta_regiao(regiao)
    if regiao.present?  
      where(intranet_regiao_id: regiao) 
    else
      all
    end
  end
  def self.consulta_entrancia(entrancia) 
    if entrancia.present?  
      where(intranet_entrancia_id: entrancia) 
    else
      all
    end
  end
  def self.consulta_contribuicao(contribuicao) 
    if contribuicao.present?  
      where(intranet_contribuicao_id: contribuicao) 
    else
      all
    end
  end 
  def self.consulta_atividade(atividade) 
    if atividade.present?  
      where('intranet_atividade_id @> ARRAY[?]::integer[]', atividade)
    else
      all
    end
  end
end
