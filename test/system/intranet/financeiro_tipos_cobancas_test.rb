require "application_system_test_case"

class Intranet::FinanceiroTiposCobancasTest < ApplicationSystemTestCase
  setup do
    @intranet_financeiro_tipos_cobanca = intranet_financeiro_tipos_cobancas(:one)
  end

  test "visiting the index" do
    visit intranet_financeiro_tipos_cobancas_url
    assert_selector "h1", text: "Intranet/Financeiro Tipos Cobancas"
  end

  test "creating a Financeiro tipos cobanca" do
    visit intranet_financeiro_tipos_cobancas_url
    click_on "New Intranet/Financeiro Tipos Cobanca"

    check "Ativo" if @intranet_financeiro_tipos_cobanca.ativo
    fill_in "Descricao", with: @intranet_financeiro_tipos_cobanca.descricao
    check "Sindical" if @intranet_financeiro_tipos_cobanca.sindical
    fill_in "Tipo valor", with: @intranet_financeiro_tipos_cobanca.tipo_valor
    click_on "Create Financeiro tipos cobanca"

    assert_text "Financeiro tipos cobanca was successfully created"
    click_on "Back"
  end

  test "updating a Financeiro tipos cobanca" do
    visit intranet_financeiro_tipos_cobancas_url
    click_on "Edit", match: :first

    check "Ativo" if @intranet_financeiro_tipos_cobanca.ativo
    fill_in "Descricao", with: @intranet_financeiro_tipos_cobanca.descricao
    check "Sindical" if @intranet_financeiro_tipos_cobanca.sindical
    fill_in "Tipo valor", with: @intranet_financeiro_tipos_cobanca.tipo_valor
    click_on "Update Financeiro tipos cobanca"

    assert_text "Financeiro tipos cobanca was successfully updated"
    click_on "Back"
  end

  test "destroying a Financeiro tipos cobanca" do
    visit intranet_financeiro_tipos_cobancas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Financeiro tipos cobanca was successfully destroyed"
  end
end
