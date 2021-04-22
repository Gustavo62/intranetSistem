require "application_system_test_case"

class Intranet::ContribuicaosTest < ApplicationSystemTestCase
  setup do
    @intranet_contribuicao = intranet_contribuicaos(:one)
  end

  test "visiting the index" do
    visit intranet_contribuicaos_url
    assert_selector "h1", text: "Intranet/Contribuicaos"
  end

  test "creating a Contribuicao" do
    visit intranet_contribuicaos_url
    click_on "New Intranet/Contribuicao"

    check "Ativo" if @intranet_contribuicao.ativo
    fill_in "Descricao", with: @intranet_contribuicao.descricao
    click_on "Create Contribuicao"

    assert_text "Contribuicao was successfully created"
    click_on "Back"
  end

  test "updating a Contribuicao" do
    visit intranet_contribuicaos_url
    click_on "Edit", match: :first

    check "Ativo" if @intranet_contribuicao.ativo
    fill_in "Descricao", with: @intranet_contribuicao.descricao
    click_on "Update Contribuicao"

    assert_text "Contribuicao was successfully updated"
    click_on "Back"
  end

  test "destroying a Contribuicao" do
    visit intranet_contribuicaos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Contribuicao was successfully destroyed"
  end
end
