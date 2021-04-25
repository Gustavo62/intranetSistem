class Intranet::Boleto < ApplicationRecord
  belongs_to :intranet_financeiro_tipos_cobranca
  belongs_to :intranet_regiao
  belongs_to :intranet_entrancias
  belongs_to :intranet_contribuicao
  belongs_to :intranet_cartorio
end
