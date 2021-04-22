require "application_system_test_case"

class Intranet::RegiaosTest < ApplicationSystemTestCase
  setup do
    @intranet_regiao = intranet_regiaos(:one)
  end

  test "visiting the index" do
    visit intranet_regiaos_url
    assert_selector "h1", text: "Intranet/Regiaos"
  end

  test "creating a Regiao" do
    visit intranet_regiaos_url
    click_on "New Intranet/Regiao"

    check "Ativo" if @intranet_regiao.ativo
    fill_in "Descricao", with: @intranet_regiao.descricao
    click_on "Create Regiao"

    assert_text "Regiao was successfully created"
    click_on "Back"
  end

  test "updating a Regiao" do
    visit intranet_regiaos_url
    click_on "Edit", match: :first

    check "Ativo" if @intranet_regiao.ativo
    fill_in "Descricao", with: @intranet_regiao.descricao
    click_on "Update Regiao"

    assert_text "Regiao was successfully updated"
    click_on "Back"
  end

  test "destroying a Regiao" do
    visit intranet_regiaos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Regiao was successfully destroyed"
  end
end
