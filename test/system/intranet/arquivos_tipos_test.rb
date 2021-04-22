require "application_system_test_case"

class Intranet::ArquivosTiposTest < ApplicationSystemTestCase
  setup do
    @intranet_arquivos_tipo = intranet_arquivos_tipos(:one)
  end

  test "visiting the index" do
    visit intranet_arquivos_tipos_url
    assert_selector "h1", text: "Intranet/Arquivos Tipos"
  end

  test "creating a Arquivos tipo" do
    visit intranet_arquivos_tipos_url
    click_on "New Intranet/Arquivos Tipo"

    check "Ativo" if @intranet_arquivos_tipo.ativo
    fill_in "Descricao", with: @intranet_arquivos_tipo.descricao
    click_on "Create Arquivos tipo"

    assert_text "Arquivos tipo was successfully created"
    click_on "Back"
  end

  test "updating a Arquivos tipo" do
    visit intranet_arquivos_tipos_url
    click_on "Edit", match: :first

    check "Ativo" if @intranet_arquivos_tipo.ativo
    fill_in "Descricao", with: @intranet_arquivos_tipo.descricao
    click_on "Update Arquivos tipo"

    assert_text "Arquivos tipo was successfully updated"
    click_on "Back"
  end

  test "destroying a Arquivos tipo" do
    visit intranet_arquivos_tipos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Arquivos tipo was successfully destroyed"
  end
end
