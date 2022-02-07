require "test_helper"

class Intranet::EventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @intranet_event = intranet_events(:one)
  end

  test "should get index" do
    get intranet_events_url
    assert_response :success
  end

  test "should get new" do
    get new_intranet_event_url
    assert_response :success
  end

  test "should create intranet_event" do
    assert_difference('Intranet::Event.count') do
      post intranet_events_url, params: { intranet_event: { ativo: @intranet_event.ativo, cabecalho_1: @intranet_event.cabecalho_1, cabecalho_2: @intranet_event.cabecalho_2, data_max_pagamento: @intranet_event.data_max_pagamento, dias_boleto: @intranet_event.dias_boleto, insc_fim: @intranet_event.insc_fim, insc_ini: @intranet_event.insc_ini, intranet_boleto_id: @intranet_event.intranet_boleto_id, periodo_fim: @intranet_event.periodo_fim, periodo_ini: @intranet_event.periodo_ini, qtd_insc_cart: @intranet_event.qtd_insc_cart, qtd_insc_total: @intranet_event.qtd_insc_total, tipo: @intranet_event.tipo, titulo: @intranet_event.titulo, valor: @intranet_event.valor } }
    end

    assert_redirected_to intranet_event_url(Intranet::Event.last)
  end

  test "should show intranet_event" do
    get intranet_event_url(@intranet_event)
    assert_response :success
  end

  test "should get edit" do
    get edit_intranet_event_url(@intranet_event)
    assert_response :success
  end

  test "should update intranet_event" do
    patch intranet_event_url(@intranet_event), params: { intranet_event: { ativo: @intranet_event.ativo, cabecalho_1: @intranet_event.cabecalho_1, cabecalho_2: @intranet_event.cabecalho_2, data_max_pagamento: @intranet_event.data_max_pagamento, dias_boleto: @intranet_event.dias_boleto, insc_fim: @intranet_event.insc_fim, insc_ini: @intranet_event.insc_ini, intranet_boleto_id: @intranet_event.intranet_boleto_id, periodo_fim: @intranet_event.periodo_fim, periodo_ini: @intranet_event.periodo_ini, qtd_insc_cart: @intranet_event.qtd_insc_cart, qtd_insc_total: @intranet_event.qtd_insc_total, tipo: @intranet_event.tipo, titulo: @intranet_event.titulo, valor: @intranet_event.valor } }
    assert_redirected_to intranet_event_url(@intranet_event)
  end

  test "should destroy intranet_event" do
    assert_difference('Intranet::Event.count', -1) do
      delete intranet_event_url(@intranet_event)
    end

    assert_redirected_to intranet_events_url
  end
end
