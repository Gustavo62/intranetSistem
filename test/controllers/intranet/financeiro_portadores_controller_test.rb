require "test_helper"

class Intranet::FinanceiroPortadoresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @intranet_financeiro_portadore = intranet_financeiro_portadores(:one)
  end

  test "should get index" do
    get intranet_financeiro_portadores_url
    assert_response :success
  end

  test "should get new" do
    get new_intranet_financeiro_portadore_url
    assert_response :success
  end

  test "should create intranet_financeiro_portadore" do
    assert_difference('Intranet::FinanceiroPortadore.count') do
      post intranet_financeiro_portadores_url, params: { intranet_financeiro_portadore: { aceite: @intranet_financeiro_portadore.aceite, agencia: @intranet_financeiro_portadore.agencia, arquivo: @intranet_financeiro_portadore.arquivo, carteira: @intranet_financeiro_portadore.carteira, cnpj: @intranet_financeiro_portadore.cnpj, codigo_banco: @intranet_financeiro_portadore.codigo_banco, conta: @intranet_financeiro_portadore.conta, empresa: @intranet_financeiro_portadore.empresa, especie_titulo: @intranet_financeiro_portadore.especie_titulo, moeda: @intranet_financeiro_portadore.moeda, nome_certificado: @intranet_financeiro_portadore.nome_certificado, numero_final: @intranet_financeiro_portadore.numero_final, numero_inicial_1: @intranet_financeiro_portadore.numero_inicial_1, numero_inicial_2: @intranet_financeiro_portadore.numero_inicial_2, registro_online: @intranet_financeiro_portadore.registro_online, senha_certificado: @intranet_financeiro_portadore.senha_certificado } }
    end

    assert_redirected_to intranet_financeiro_portadore_url(Intranet::FinanceiroPortadore.last)
  end

  test "should show intranet_financeiro_portadore" do
    get intranet_financeiro_portadore_url(@intranet_financeiro_portadore)
    assert_response :success
  end

  test "should get edit" do
    get edit_intranet_financeiro_portadore_url(@intranet_financeiro_portadore)
    assert_response :success
  end

  test "should update intranet_financeiro_portadore" do
    patch intranet_financeiro_portadore_url(@intranet_financeiro_portadore), params: { intranet_financeiro_portadore: { aceite: @intranet_financeiro_portadore.aceite, agencia: @intranet_financeiro_portadore.agencia, arquivo: @intranet_financeiro_portadore.arquivo, carteira: @intranet_financeiro_portadore.carteira, cnpj: @intranet_financeiro_portadore.cnpj, codigo_banco: @intranet_financeiro_portadore.codigo_banco, conta: @intranet_financeiro_portadore.conta, empresa: @intranet_financeiro_portadore.empresa, especie_titulo: @intranet_financeiro_portadore.especie_titulo, moeda: @intranet_financeiro_portadore.moeda, nome_certificado: @intranet_financeiro_portadore.nome_certificado, numero_final: @intranet_financeiro_portadore.numero_final, numero_inicial_1: @intranet_financeiro_portadore.numero_inicial_1, numero_inicial_2: @intranet_financeiro_portadore.numero_inicial_2, registro_online: @intranet_financeiro_portadore.registro_online, senha_certificado: @intranet_financeiro_portadore.senha_certificado } }
    assert_redirected_to intranet_financeiro_portadore_url(@intranet_financeiro_portadore)
  end

  test "should destroy intranet_financeiro_portadore" do
    assert_difference('Intranet::FinanceiroPortadore.count', -1) do
      delete intranet_financeiro_portadore_url(@intranet_financeiro_portadore)
    end

    assert_redirected_to intranet_financeiro_portadores_url
  end
end
