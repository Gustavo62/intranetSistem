require "application_system_test_case"

class Intranet::DepartamentosTest < ApplicationSystemTestCase
  setup do
    @intranet_departamento = intranet_departamentos(:one)
  end

  test "visiting the index" do
    visit intranet_departamentos_url
    assert_selector "h1", text: "Intranet/Departamentos"
  end

  test "creating a Departamento" do
    visit intranet_departamentos_url
    click_on "New Intranet/Departamento"

    check "Ativo" if @intranet_departamento.ativo
    fill_in "Descricao", with: @intranet_departamento.descricao
    click_on "Create Departamento"

    assert_text "Departamento was successfully created"
    click_on "Back"
  end

  test "updating a Departamento" do
    visit intranet_departamentos_url
    click_on "Edit", match: :first

    check "Ativo" if @intranet_departamento.ativo
    fill_in "Descricao", with: @intranet_departamento.descricao
    click_on "Update Departamento"

    assert_text "Departamento was successfully updated"
    click_on "Back"
  end

  test "destroying a Departamento" do
    visit intranet_departamentos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Departamento was successfully destroyed"
  end
end
