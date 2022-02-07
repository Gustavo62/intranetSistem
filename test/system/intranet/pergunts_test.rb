require "application_system_test_case"

class Intranet::PerguntsTest < ApplicationSystemTestCase
  setup do
    @intranet_pergunt = intranet_pergunts(:one)
  end

  test "visiting the index" do
    visit intranet_pergunts_url
    assert_selector "h1", text: "Intranet/Pergunts"
  end

  test "creating a Pergunt" do
    visit intranet_pergunts_url
    click_on "New Intranet/Pergunt"

    fill_in "Assunto", with: @intranet_pergunt.assunto
    fill_in "Intranet associado", with: @intranet_pergunt.intranet_associado_id
    fill_in "Mensagem pergunta", with: @intranet_pergunt.mensagem_pergunta
    fill_in "Mensagem resposta", with: @intranet_pergunt.mensagem_resposta
    fill_in "Profissional", with: @intranet_pergunt.profissional_id
    fill_in "Tipo", with: @intranet_pergunt.tipo
    click_on "Create Pergunt"

    assert_text "Pergunt was successfully created"
    click_on "Back"
  end

  test "updating a Pergunt" do
    visit intranet_pergunts_url
    click_on "Edit", match: :first

    fill_in "Assunto", with: @intranet_pergunt.assunto
    fill_in "Intranet associado", with: @intranet_pergunt.intranet_associado_id
    fill_in "Mensagem pergunta", with: @intranet_pergunt.mensagem_pergunta
    fill_in "Mensagem resposta", with: @intranet_pergunt.mensagem_resposta
    fill_in "Profissional", with: @intranet_pergunt.profissional_id
    fill_in "Tipo", with: @intranet_pergunt.tipo
    click_on "Update Pergunt"

    assert_text "Pergunt was successfully updated"
    click_on "Back"
  end

  test "destroying a Pergunt" do
    visit intranet_pergunts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Pergunt was successfully destroyed"
  end
end
