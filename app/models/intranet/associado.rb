class Intranet::Associado < ApplicationRecord 
  validates    :user_id, presence: true
  has_one      :cidade  
  belongs_to   :user, dependent: :destroy
  has_many     :pergunts
  has_many     :boletos
  has_many     :contribuicao_importadas
  has_many     :presencs
  has_many     :fixa_filiacao, foreign_key: 'intranet_associado_id', dependent: :destroy
  has_many     :termo_posse, foreign_key: 'intranet_associado_id', dependent: :destroy
  def self.pesquisa_assoc(acesso_param)
    if acesso_param.present? 
      acesso = true if acesso_param == "0"
      acesso = false if acesso_param == "1"
      where(ativo: acesso) 
    else
      all
    end
  end

  def self.pesquisa_cidade(cidad_params)
    if cidad_params.present?  
      where(id: cidad_params) 
    else
      all
    end
  end
  
  def self.pesquisa_assoc_id(id)
    if id.present?  
      where(id: id) 
    else
      all
    end
  end
end
