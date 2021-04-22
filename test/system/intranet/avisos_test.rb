require "application_system_test_case"

class Intranet::AvisosTest < ApplicationSystemTestCase
  setup do
    @intranet_aviso = intranet_avisos(:one)
  end

  test "visiting the index" do
    visit intranet_avisos_url
    assert_selector "h1", text: "Intranet/Avisos"
  end

  test "creating a Aviso" do
    visit intranet_avisos_url
    click_on "New Intranet/Aviso"

    fill_in "Atividade", with: @intranet_aviso.atividade_id
    check "Ativo" if @intranet_aviso.ativo
    fill_in "Descricao", with: @intranet_aviso.descricao
    click_on "Create Aviso"

    assert_text "Aviso was successfully created"
    click_on "Back"
  end

  test "updating a Aviso" do
    visit intranet_avisos_url
    click_on "Edit", match: :first

    fill_in "Atividade", with: @intranet_aviso.atividade_id
    check "Ativo" if @intranet_aviso.ativo
    fill_in "Descricao", with: @intranet_aviso.descricao
    click_on "Update Aviso"

    assert_text "Aviso was successfully updated"
    click_on "Back"
  end

  test "destroying a Aviso" do
    visit intranet_avisos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Aviso was successfully destroyed"
  end
end
