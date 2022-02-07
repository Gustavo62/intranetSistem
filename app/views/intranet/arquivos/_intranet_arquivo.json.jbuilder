json.extract! intranet_arquivo, :id, :intranet_arquivos_tipo_id, :intranet_cartorio_id, :intranet_atividade_id, :ativo, :descricao, :created_at, :updated_at
json.url intranet_arquivo_url(intranet_arquivo, format: :json)
