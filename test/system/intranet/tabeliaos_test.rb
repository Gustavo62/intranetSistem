require "application_system_test_case"

class Intranet::TabeliaosTest < ApplicationSystemTestCase
  setup do
    @intranet_tabeliao = intranet_tabeliaos(:one)
  end

  test "visiting the index" do
    visit intranet_tabeliaos_url
    assert_selector "h1", text: "Intranet/Tabeliaos"
  end

  test "creating a Tabeliao" do
    visit intranet_tabeliaos_url
    click_on "New Intranet/Tabeliao"

    check "Atual?" if @intranet_tabeliao.atual?
    fill_in "Cpf", with: @intranet_tabeliao.cpf
    fill_in "Dt final", with: @intranet_tabeliao.dt_final
    fill_in "Dt inicio", with: @intranet_tabeliao.dt_inicio
    fill_in "Email", with: @intranet_tabeliao.email
    fill_in "Nome", with: @intranet_tabeliao.nome
    fill_in "Rg", with: @intranet_tabeliao.rg
    fill_in "Telefone", with: @intranet_tabeliao.telefone
    check "Whatsapp" if @intranet_tabeliao.whatsapp
    click_on "Create Tabeliao"

    assert_text "Tabeliao was successfully created"
    click_on "Back"
  end

  test "updating a Tabeliao" do
    visit intranet_tabeliaos_url
    click_on "Edit", match: :first

    check "Atual?" if @intranet_tabeliao.atual?
    fill_in "Cpf", with: @intranet_tabeliao.cpf
    fill_in "Dt final", with: @intranet_tabeliao.dt_final
    fill_in "Dt inicio", with: @intranet_tabeliao.dt_inicio
    fill_in "Email", with: @intranet_tabeliao.email
    fill_in "Nome", with: @intranet_tabeliao.nome
    fill_in "Rg", with: @intranet_tabeliao.rg
    fill_in "Telefone", with: @intranet_tabeliao.telefone
    check "Whatsapp" if @intranet_tabeliao.whatsapp
    click_on "Update Tabeliao"

    assert_text "Tabeliao was successfully updated"
    click_on "Back"
  end

  test "destroying a Tabeliao" do
    visit intranet_tabeliaos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tabeliao was successfully destroyed"
  end
end
