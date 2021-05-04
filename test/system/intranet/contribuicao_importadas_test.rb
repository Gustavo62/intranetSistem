require "application_system_test_case"

class Intranet::ContribuicaoImportadasTest < ApplicationSystemTestCase
  setup do
    @intranet_contribuicao_importada = intranet_contribuicao_importadas(:one)
  end

  test "visiting the index" do
    visit intranet_contribuicao_importadas_url
    assert_selector "h1", text: "Intranet/Contribuicao Importadas"
  end

  test "creating a Contribuicao importada" do
    visit intranet_contribuicao_importadas_url
    click_on "New Intranet/Contribuicao Importada"

    fill_in "Ano", with: @intranet_contribuicao_importada.ano
    fill_in "Documento", with: @intranet_contribuicao_importada.documento
    click_on "Create Contribuicao importada"

    assert_text "Contribuicao importada was successfully created"
    click_on "Back"
  end

  test "updating a Contribuicao importada" do
    visit intranet_contribuicao_importadas_url
    click_on "Edit", match: :first

    fill_in "Ano", with: @intranet_contribuicao_importada.ano
    fill_in "Documento", with: @intranet_contribuicao_importada.documento
    click_on "Update Contribuicao importada"

    assert_text "Contribuicao importada was successfully updated"
    click_on "Back"
  end

  test "destroying a Contribuicao importada" do
    visit intranet_contribuicao_importadas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Contribuicao importada was successfully destroyed"
  end
end
