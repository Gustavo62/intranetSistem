json.extract! intranet_boleto, :id, :intranet_financeiro_tipos_cobranca_id, :intranet_financeiro_portadores, :intranet_regiao_id, :intranet_entrancias_id, :intranet_contribuicao_id, :intranet_atividade, :intranet_cartorio_id, :valor, :vencimento, :descricao, :observacao_email, :forma_cobranca, :apenas_titular, :created_at, :updated_at
json.url intranet_boleto_url(intranet_boleto, format: :json)
