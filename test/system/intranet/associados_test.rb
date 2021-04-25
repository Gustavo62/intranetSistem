require "application_system_test_case"

class Intranet::AssociadosTest < ApplicationSystemTestCase
  setup do
    @intranet_associado = intranet_associados(:one)
  end

  test "visiting the index" do
    visit intranet_associados_url
    assert_selector "h1", text: "Intranet/Associados"
  end

  test "creating a Associado" do
    visit intranet_associados_url
    click_on "New Intranet/Associado"

    check "Ativo" if @intranet_associado.ativo
    fill_in "Bairro", with: @intranet_associado.bairro
    fill_in "Celular", with: @intranet_associado.celular
    fill_in "Cep", with: @intranet_associado.cep
    fill_in "Cidade", with: @intranet_associado.cidade_id
    fill_in "Complemento", with: @intranet_associado.complemento
    fill_in "Data nascimento", with: @intranet_associado.data_nascimento
    fill_in "Email", with: @intranet_associado.email
    fill_in "Funcao", with: @intranet_associado.funcao
    fill_in "Logradouro", with: @intranet_associado.logradouro
    fill_in "Matricula", with: @intranet_associado.matricula
    fill_in "Rg", with: @intranet_associado.rg
    check "Sexo" if @intranet_associado.sexo
    fill_in "Telefone 1", with: @intranet_associado.telefone_1
    fill_in "Telefone 2", with: @intranet_associado.telefone_2
    fill_in "User", with: @intranet_associado.user_id
    fill_in "Whatsapp", with: @intranet_associado.whatsapp
    click_on "Create Associado"

    assert_text "Associado was successfully created"
    click_on "Back"
  end

  test "updating a Associado" do
    visit intranet_associados_url
    click_on "Edit", match: :first

    check "Ativo" if @intranet_associado.ativo
    fill_in "Bairro", with: @intranet_associado.bairro
    fill_in "Celular", with: @intranet_associado.celular
    fill_in "Cep", with: @intranet_associado.cep
    fill_in "Cidade", with: @intranet_associado.cidade_id
    fill_in "Complemento", with: @intranet_associado.complemento
    fill_in "Data nascimento", with: @intranet_associado.data_nascimento
    fill_in "Email", with: @intranet_associado.email
    fill_in "Funcao", with: @intranet_associado.funcao
    fill_in "Logradouro", with: @intranet_associado.logradouro
    fill_in "Matricula", with: @intranet_associado.matricula
    fill_in "Rg", with: @intranet_associado.rg
    check "Sexo" if @intranet_associado.sexo
    fill_in "Telefone 1", with: @intranet_associado.telefone_1
    fill_in "Telefone 2", with: @intranet_associado.telefone_2
    fill_in "User", with: @intranet_associado.user_id
    fill_in "Whatsapp", with: @intranet_associado.whatsapp
    click_on "Update Associado"

    assert_text "Associado was successfully updated"
    click_on "Back"
  end

  test "destroying a Associado" do
    visit intranet_associados_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Associado was successfully destroyed"
  end
end
