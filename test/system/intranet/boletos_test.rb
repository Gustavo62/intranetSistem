require "application_system_test_case"

class Intranet::BoletosTest < ApplicationSystemTestCase
  setup do
    @intranet_boleto = intranet_boletos(:one)
  end

  test "visiting the index" do
    visit intranet_boletos_url
    assert_selector "h1", text: "Intranet/Boletos"
  end

  test "creating a Boleto" do
    visit intranet_boletos_url
    click_on "New Intranet/Boleto"

    check "Apenas titular" if @intranet_boleto.apenas_titular
    fill_in "Descricao", with: @intranet_boleto.descricao
    fill_in "Forma cobranca", with: @intranet_boleto.forma_cobranca
    fill_in "Intranet atividade", with: @intranet_boleto.intranet_atividade
    fill_in "Intranet cartorio", with: @intranet_boleto.intranet_cartorio_id
    fill_in "Intranet contribuicao", with: @intranet_boleto.intranet_contribuicao_id
    fill_in "Intranet entrancias", with: @intranet_boleto.intranet_entrancias_id
    fill_in "Intranet financeiro portadores", with: @intranet_boleto.intranet_financeiro_portadores
    fill_in "Intranet financeiro tipos cobranca", with: @intranet_boleto.intranet_financeiro_tipos_cobranca_id
    fill_in "Intranet regiao", with: @intranet_boleto.intranet_regiao_id
    fill_in "Observacao email", with: @intranet_boleto.observacao_email
    fill_in "Valor", with: @intranet_boleto.valor
    fill_in "Vencimento", with: @intranet_boleto.vencimento
    click_on "Create Boleto"

    assert_text "Boleto was successfully created"
    click_on "Back"
  end

  test "updating a Boleto" do
    visit intranet_boletos_url
    click_on "Edit", match: :first

    check "Apenas titular" if @intranet_boleto.apenas_titular
    fill_in "Descricao", with: @intranet_boleto.descricao
    fill_in "Forma cobranca", with: @intranet_boleto.forma_cobranca
    fill_in "Intranet atividade", with: @intranet_boleto.intranet_atividade
    fill_in "Intranet cartorio", with: @intranet_boleto.intranet_cartorio_id
    fill_in "Intranet contribuicao", with: @intranet_boleto.intranet_contribuicao_id
    fill_in "Intranet entrancias", with: @intranet_boleto.intranet_entrancias_id
    fill_in "Intranet financeiro portadores", with: @intranet_boleto.intranet_financeiro_portadores
    fill_in "Intranet financeiro tipos cobranca", with: @intranet_boleto.intranet_financeiro_tipos_cobranca_id
    fill_in "Intranet regiao", with: @intranet_boleto.intranet_regiao_id
    fill_in "Observacao email", with: @intranet_boleto.observacao_email
    fill_in "Valor", with: @intranet_boleto.valor
    fill_in "Vencimento", with: @intranet_boleto.vencimento
    click_on "Update Boleto"

    assert_text "Boleto was successfully updated"
    click_on "Back"
  end

  test "destroying a Boleto" do
    visit intranet_boletos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Boleto was successfully destroyed"
  end
end
