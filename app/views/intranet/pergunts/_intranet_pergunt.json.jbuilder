json.extract! intranet_pergunt, :id, :mensagem_pergunta, :tipo, :intranet_associado_id, :assunto, :profissional_id, :mensagem_resposta, :created_at, :updated_at
json.url intranet_pergunt_url(intranet_pergunt, format: :json)
