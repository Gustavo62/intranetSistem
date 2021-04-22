json.extract! intranet_atividade, :id, :descricao, :ativo, :created_at, :updated_at
json.url intranet_atividade_url(intranet_atividade, format: :json)
