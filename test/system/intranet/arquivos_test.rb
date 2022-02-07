require "application_system_test_case"

class Intranet::ArquivosTest < ApplicationSystemTestCase
  setup do
    @intranet_arquivo = intranet_arquivos(:one)
  end

  test "visiting the index" do
    visit intranet_arquivos_url
    assert_selector "h1", text: "Intranet/Arquivos"
  end

  test "creating a Arquivo" do
    visit intranet_arquivos_url
    click_on "New Intranet/Arquivo"

    check "Ativo" if @intranet_arquivo.ativo
    fill_in "Descricao", with: @intranet_arquivo.descricao
    fill_in "Intranet arquivos tipo", with: @intranet_arquivo.intranet_arquivos_tipo_id
    fill_in "Intranet atividade", with: @intranet_arquivo.intranet_atividade_id
    fill_in "Intranet cartorio", with: @intranet_arquivo.intranet_cartorio_id
    click_on "Create Arquivo"

    assert_text "Arquivo was successfully created"
    click_on "Back"
  end

  test "updating a Arquivo" do
    visit intranet_arquivos_url
    click_on "Edit", match: :first

    check "Ativo" if @intranet_arquivo.ativo
    fill_in "Descricao", with: @intranet_arquivo.descricao
    fill_in "Intranet arquivos tipo", with: @intranet_arquivo.intranet_arquivos_tipo_id
    fill_in "Intranet atividade", with: @intranet_arquivo.intranet_atividade_id
    fill_in "Intranet cartorio", with: @intranet_arquivo.intranet_cartorio_id
    click_on "Update Arquivo"

    assert_text "Arquivo was successfully updated"
    click_on "Back"
  end

  test "destroying a Arquivo" do
    visit intranet_arquivos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Arquivo was successfully destroyed"
  end
end
