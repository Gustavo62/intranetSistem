require "application_system_test_case"

class Intranet::PrivilegiosTest < ApplicationSystemTestCase
  setup do
    @intranet_privilegio = intranet_privilegios(:one)
  end

  test "visiting the index" do
    visit intranet_privilegios_url
    assert_selector "h1", text: "Intranet/Privilegios"
  end

  test "creating a Privilegio" do
    visit intranet_privilegios_url
    click_on "New Intranet/Privilegio"

    check "Ativo" if @intranet_privilegio.ativo
    fill_in "Descricao", with: @intranet_privilegio.descricao
    click_on "Create Privilegio"

    assert_text "Privilegio was successfully created"
    click_on "Back"
  end

  test "updating a Privilegio" do
    visit intranet_privilegios_url
    click_on "Edit", match: :first

    check "Ativo" if @intranet_privilegio.ativo
    fill_in "Descricao", with: @intranet_privilegio.descricao
    click_on "Update Privilegio"

    assert_text "Privilegio was successfully updated"
    click_on "Back"
  end

  test "destroying a Privilegio" do
    visit intranet_privilegios_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Privilegio was successfully destroyed"
  end
end
