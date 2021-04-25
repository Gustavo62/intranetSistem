require "application_system_test_case"

class Intranet::FinanceiroPortadoresTest < ApplicationSystemTestCase
  setup do
    @intranet_financeiro_portadore = intranet_financeiro_portadores(:one)
  end

  test "visiting the index" do
    visit intranet_financeiro_portadores_url
    assert_selector "h1", text: "Intranet/Financeiro Portadores"
  end

  test "creating a Financeiro portadore" do
    visit intranet_financeiro_portadores_url
    click_on "New Intranet/Financeiro Portadore"

    check "Aceite" if @intranet_financeiro_portadore.aceite
    fill_in "Agencia", with: @intranet_financeiro_portadore.agencia
    fill_in "Arquivo", with: @intranet_financeiro_portadore.arquivo
    fill_in "Carteira", with: @intranet_financeiro_portadore.carteira
    fill_in "Cnpj", with: @intranet_financeiro_portadore.cnpj
    fill_in "Codigo banco", with: @intranet_financeiro_portadore.codigo_banco
    fill_in "Conta", with: @intranet_financeiro_portadore.conta
    fill_in "Empresa", with: @intranet_financeiro_portadore.empresa
    fill_in "Especie titulo", with: @intranet_financeiro_portadore.especie_titulo
    fill_in "Moeda", with: @intranet_financeiro_portadore.moeda
    fill_in "Nome certificado", with: @intranet_financeiro_portadore.nome_certificado
    fill_in "Numero final", with: @intranet_financeiro_portadore.numero_final
    fill_in "Numero inicial 1", with: @intranet_financeiro_portadore.numero_inicial_1
    fill_in "Numero inicial 2", with: @intranet_financeiro_portadore.numero_inicial_2
    fill_in "Registro online", with: @intranet_financeiro_portadore.registro_online
    fill_in "Senha certificado", with: @intranet_financeiro_portadore.senha_certificado
    click_on "Create Financeiro portadore"

    assert_text "Financeiro portadore was successfully created"
    click_on "Back"
  end

  test "updating a Financeiro portadore" do
    visit intranet_financeiro_portadores_url
    click_on "Edit", match: :first

    check "Aceite" if @intranet_financeiro_portadore.aceite
    fill_in "Agencia", with: @intranet_financeiro_portadore.agencia
    fill_in "Arquivo", with: @intranet_financeiro_portadore.arquivo
    fill_in "Carteira", with: @intranet_financeiro_portadore.carteira
    fill_in "Cnpj", with: @intranet_financeiro_portadore.cnpj
    fill_in "Codigo banco", with: @intranet_financeiro_portadore.codigo_banco
    fill_in "Conta", with: @intranet_financeiro_portadore.conta
    fill_in "Empresa", with: @intranet_financeiro_portadore.empresa
    fill_in "Especie titulo", with: @intranet_financeiro_portadore.especie_titulo
    fill_in "Moeda", with: @intranet_financeiro_portadore.moeda
    fill_in "Nome certificado", with: @intranet_financeiro_portadore.nome_certificado
    fill_in "Numero final", with: @intranet_financeiro_portadore.numero_final
    fill_in "Numero inicial 1", with: @intranet_financeiro_portadore.numero_inicial_1
    fill_in "Numero inicial 2", with: @intranet_financeiro_portadore.numero_inicial_2
    fill_in "Registro online", with: @intranet_financeiro_portadore.registro_online
    fill_in "Senha certificado", with: @intranet_financeiro_portadore.senha_certificado
    click_on "Update Financeiro portadore"

    assert_text "Financeiro portadore was successfully updated"
    click_on "Back"
  end

  test "destroying a Financeiro portadore" do
    visit intranet_financeiro_portadores_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Financeiro portadore was successfully destroyed"
  end
end
