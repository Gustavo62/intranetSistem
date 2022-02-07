require "application_system_test_case"

class Intranet::EventsTest < ApplicationSystemTestCase
  setup do
    @intranet_event = intranet_events(:one)
  end

  test "visiting the index" do
    visit intranet_events_url
    assert_selector "h1", text: "Intranet/Events"
  end

  test "creating a Event" do
    visit intranet_events_url
    click_on "New Intranet/Event"

    check "Ativo" if @intranet_event.ativo
    fill_in "Cabecalho 1", with: @intranet_event.cabecalho_1
    fill_in "Cabecalho 2", with: @intranet_event.cabecalho_2
    fill_in "Data max pagamento", with: @intranet_event.data_max_pagamento
    fill_in "Dias boleto", with: @intranet_event.dias_boleto
    fill_in "Insc fim", with: @intranet_event.insc_fim
    fill_in "Insc ini", with: @intranet_event.insc_ini
    fill_in "Intranet boleto", with: @intranet_event.intranet_boleto_id
    fill_in "Periodo fim", with: @intranet_event.periodo_fim
    fill_in "Periodo ini", with: @intranet_event.periodo_ini
    fill_in "Qtd insc cart", with: @intranet_event.qtd_insc_cart
    fill_in "Qtd insc total", with: @intranet_event.qtd_insc_total
    fill_in "Tipo", with: @intranet_event.tipo
    fill_in "Titulo", with: @intranet_event.titulo
    fill_in "Valor", with: @intranet_event.valor
    click_on "Create Event"

    assert_text "Event was successfully created"
    click_on "Back"
  end

  test "updating a Event" do
    visit intranet_events_url
    click_on "Edit", match: :first

    check "Ativo" if @intranet_event.ativo
    fill_in "Cabecalho 1", with: @intranet_event.cabecalho_1
    fill_in "Cabecalho 2", with: @intranet_event.cabecalho_2
    fill_in "Data max pagamento", with: @intranet_event.data_max_pagamento
    fill_in "Dias boleto", with: @intranet_event.dias_boleto
    fill_in "Insc fim", with: @intranet_event.insc_fim
    fill_in "Insc ini", with: @intranet_event.insc_ini
    fill_in "Intranet boleto", with: @intranet_event.intranet_boleto_id
    fill_in "Periodo fim", with: @intranet_event.periodo_fim
    fill_in "Periodo ini", with: @intranet_event.periodo_ini
    fill_in "Qtd insc cart", with: @intranet_event.qtd_insc_cart
    fill_in "Qtd insc total", with: @intranet_event.qtd_insc_total
    fill_in "Tipo", with: @intranet_event.tipo
    fill_in "Titulo", with: @intranet_event.titulo
    fill_in "Valor", with: @intranet_event.valor
    click_on "Update Event"

    assert_text "Event was successfully updated"
    click_on "Back"
  end

  test "destroying a Event" do
    visit intranet_events_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Event was successfully destroyed"
  end
end
