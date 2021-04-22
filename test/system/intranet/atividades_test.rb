require "application_system_test_case"

class Intranet::AtividadesTest < ApplicationSystemTestCase
  setup do
    @intranet_atividade = intranet_atividades(:one)
  end

  test "visiting the index" do
    visit intranet_atividades_url
    assert_selector "h1", text: "Intranet/Atividades"
  end

  test "creating a Atividade" do
    visit intranet_atividades_url
    click_on "New Intranet/Atividade"

    check "Ativo" if @intranet_atividade.ativo
    fill_in "Descricao", with: @intranet_atividade.descricao
    click_on "Create Atividade"

    assert_text "Atividade was successfully created"
    click_on "Back"
  end

  test "updating a Atividade" do
    visit intranet_atividades_url
    click_on "Edit", match: :first

    check "Ativo" if @intranet_atividade.ativo
    fill_in "Descricao", with: @intranet_atividade.descricao
    click_on "Update Atividade"

    assert_text "Atividade was successfully updated"
    click_on "Back"
  end

  test "destroying a Atividade" do
    visit intranet_atividades_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Atividade was successfully destroyed"
  end
end
