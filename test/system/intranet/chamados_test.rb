require "application_system_test_case"

class Intranet::ChamadosTest < ApplicationSystemTestCase
  setup do
    @intranet_chamado = intranet_chamados(:one)
  end

  test "visiting the index" do
    visit intranet_chamados_url
    assert_selector "h1", text: "Intranet/Chamados"
  end

  test "creating a Chamado" do
    visit intranet_chamados_url
    click_on "New Intranet/Chamado"

    fill_in "Assunto", with: @intranet_chamado.assunto
    fill_in "Intranet associado", with: @intranet_chamado.intranet_associado_id
    fill_in "Mensagem pergunta", with: @intranet_chamado.mensagem_pergunta
    fill_in "Mensagem resposta", with: @intranet_chamado.mensagem_resposta
    fill_in "Profissional", with: @intranet_chamado.profissional_id
    check "Visualizada" if @intranet_chamado.visualizada
    fill_in "Visualizada at", with: @intranet_chamado.visualizada_at
    click_on "Create Chamado"

    assert_text "Chamado was successfully created"
    click_on "Back"
  end

  test "updating a Chamado" do
    visit intranet_chamados_url
    click_on "Edit", match: :first

    fill_in "Assunto", with: @intranet_chamado.assunto
    fill_in "Intranet associado", with: @intranet_chamado.intranet_associado_id
    fill_in "Mensagem pergunta", with: @intranet_chamado.mensagem_pergunta
    fill_in "Mensagem resposta", with: @intranet_chamado.mensagem_resposta
    fill_in "Profissional", with: @intranet_chamado.profissional_id
    check "Visualizada" if @intranet_chamado.visualizada
    fill_in "Visualizada at", with: @intranet_chamado.visualizada_at
    click_on "Update Chamado"

    assert_text "Chamado was successfully updated"
    click_on "Back"
  end

  test "destroying a Chamado" do
    visit intranet_chamados_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Chamado was successfully destroyed"
  end
end
