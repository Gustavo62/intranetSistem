require "application_system_test_case"

class Intranet::EntranciaTest < ApplicationSystemTestCase
  setup do
    @intranet_entrancium = intranet_entrancia(:one)
  end

  test "visiting the index" do
    visit intranet_entrancia_url
    assert_selector "h1", text: "Intranet/Entrancia"
  end

  test "creating a Entrancium" do
    visit intranet_entrancia_url
    click_on "New Intranet/Entrancium"

    check "Ativo" if @intranet_entrancium.ativo
    fill_in "Descricao", with: @intranet_entrancium.descricao
    click_on "Create Entrancium"

    assert_text "Entrancium was successfully created"
    click_on "Back"
  end

  test "updating a Entrancium" do
    visit intranet_entrancia_url
    click_on "Edit", match: :first

    check "Ativo" if @intranet_entrancium.ativo
    fill_in "Descricao", with: @intranet_entrancium.descricao
    click_on "Update Entrancium"

    assert_text "Entrancium was successfully updated"
    click_on "Back"
  end

  test "destroying a Entrancium" do
    visit intranet_entrancia_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Entrancium was successfully destroyed"
  end
end
