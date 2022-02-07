require "application_system_test_case"

class Intranet::MalaDiretaTest < ApplicationSystemTestCase
  setup do
    @intranet_mala_diretum = intranet_mala_direta(:one)
  end

  test "visiting the index" do
    visit intranet_mala_direta_url
    assert_selector "h1", text: "Intranet/Mala Direta"
  end

  test "creating a Mala diretum" do
    visit intranet_mala_direta_url
    click_on "New Intranet/Mala Diretum"

    fill_in "Assunto", with: @intranet_mala_diretum.assunto
    fill_in "Destinatario", with: @intranet_mala_diretum.destinatario
    fill_in "Intranet atividade", with: @intranet_mala_diretum.intranet_atividade_id
    fill_in "Intranet cartorio", with: @intranet_mala_diretum.intranet_cartorio_id
    fill_in "Intranet contribuicao", with: @intranet_mala_diretum.intranet_contribuicao_id
    fill_in "Intranet entrancium", with: @intranet_mala_diretum.intranet_entrancium_id
    fill_in "Intranet regiao", with: @intranet_mala_diretum.intranet_regiao_id
    fill_in "Layout", with: @intranet_mala_diretum.layout
    click_on "Create Mala diretum"

    assert_text "Mala diretum was successfully created"
    click_on "Back"
  end

  test "updating a Mala diretum" do
    visit intranet_mala_direta_url
    click_on "Edit", match: :first

    fill_in "Assunto", with: @intranet_mala_diretum.assunto
    fill_in "Destinatario", with: @intranet_mala_diretum.destinatario
    fill_in "Intranet atividade", with: @intranet_mala_diretum.intranet_atividade_id
    fill_in "Intranet cartorio", with: @intranet_mala_diretum.intranet_cartorio_id
    fill_in "Intranet contribuicao", with: @intranet_mala_diretum.intranet_contribuicao_id
    fill_in "Intranet entrancium", with: @intranet_mala_diretum.intranet_entrancium_id
    fill_in "Intranet regiao", with: @intranet_mala_diretum.intranet_regiao_id
    fill_in "Layout", with: @intranet_mala_diretum.layout
    click_on "Update Mala diretum"

    assert_text "Mala diretum was successfully updated"
    click_on "Back"
  end

  test "destroying a Mala diretum" do
    visit intranet_mala_direta_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Mala diretum was successfully destroyed"
  end
end
