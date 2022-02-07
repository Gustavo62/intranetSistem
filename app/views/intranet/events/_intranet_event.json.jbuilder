json.extract! intranet_event, :id, :periodo_ini, :periodo_fim, :insc_ini, :insc_fim, :titulo, :cabecalho_1, :cabecalho_2, :data_max_pagamento, :qtd_insc_total, :dias_boleto, :qtd_insc_cart, :valor, :tipo, :ativo, :intranet_boleto_id, :created_at, :updated_at
json.url intranet_event_url(intranet_event, format: :json)
