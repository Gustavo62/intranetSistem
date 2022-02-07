json.extract! intranet_chamado, :id, :assunto, :intranet_associado_id, :mensagem_pergunta, :mensagem_resposta, :profissional_id, :visualizada, :visualizada_at, :created_at, :updated_at
json.url intranet_chamado_url(intranet_chamado, format: :json)
