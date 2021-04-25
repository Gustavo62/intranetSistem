require "application_system_test_case"

class Intranet::SubstitutosTest < ApplicationSystemTestCase
  setup do
    @intranet_substituto = intranet_substitutos(:one)
  end

  test "visiting the index" do
    visit intranet_substitutos_url
    assert_selector "h1", text: "Intranet/Substitutos"
  end

  test "creating a Substituto" do
    visit intranet_substitutos_url
    click_on "New Intranet/Substituto"

    check "Atual?" if @intranet_substituto.atual?
    fill_in "Cpf", with: @intranet_substituto.cpf
    fill_in "Dt final", with: @intranet_substituto.dt_final
    fill_in "Dt inicio", with: @intranet_substituto.dt_inicio
    fill_in "Email", with: @intranet_substituto.email
    fill_in "Nome", with: @intranet_substituto.nome
    fill_in "Rg", with: @intranet_substituto.rg
    fill_in "Telefone", with: @intranet_substituto.telefone
    check "Whatsapp" if @intranet_substituto.whatsapp
    click_on "Create Substituto"

    assert_text "Substituto was successfully created"
    click_on "Back"
  end

  test "updating a Substituto" do
    visit intranet_substitutos_url
    click_on "Edit", match: :first

    check "Atual?" if @intranet_substituto.atual?
    fill_in "Cpf", with: @intranet_substituto.cpf
    fill_in "Dt final", with: @intranet_substituto.dt_final
    fill_in "Dt inicio", with: @intranet_substituto.dt_inicio
    fill_in "Email", with: @intranet_substituto.email
    fill_in "Nome", with: @intranet_substituto.nome
    fill_in "Rg", with: @intranet_substituto.rg
    fill_in "Telefone", with: @intranet_substituto.telefone
    check "Whatsapp" if @intranet_substituto.whatsapp
    click_on "Update Substituto"

    assert_text "Substituto was successfully updated"
    click_on "Back"
  end

  test "destroying a Substituto" do
    visit intranet_substitutos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Substituto was successfully destroyed"
  end
end
