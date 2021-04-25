require "test_helper"

class Intranet::FinanceiroTiposCobancasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @intranet_financeiro_tipos_cobanca = intranet_financeiro_tipos_cobancas(:one)
  end

  test "should get index" do
    get intranet_financeiro_tipos_cobancas_url
    assert_response :success
  end

  test "should get new" do
    get new_intranet_financeiro_tipos_cobanca_url
    assert_response :success
  end

  test "should create intranet_financeiro_tipos_cobanca" do
    assert_difference('Intranet::FinanceiroTiposCobanca.count') do
      post intranet_financeiro_tipos_cobancas_url, params: { intranet_financeiro_tipos_cobanca: { ativo: @intranet_financeiro_tipos_cobanca.ativo, descricao: @intranet_financeiro_tipos_cobanca.descricao, sindical: @intranet_financeiro_tipos_cobanca.sindical, tipo_valor: @intranet_financeiro_tipos_cobanca.tipo_valor } }
    end

    assert_redirected_to intranet_financeiro_tipos_cobanca_url(Intranet::FinanceiroTiposCobanca.last)
  end

  test "should show intranet_financeiro_tipos_cobanca" do
    get intranet_financeiro_tipos_cobanca_url(@intranet_financeiro_tipos_cobanca)
    assert_response :success
  end

  test "should get edit" do
    get edit_intranet_financeiro_tipos_cobanca_url(@intranet_financeiro_tipos_cobanca)
    assert_response :success
  end

  test "should update intranet_financeiro_tipos_cobanca" do
    patch intranet_financeiro_tipos_cobanca_url(@intranet_financeiro_tipos_cobanca), params: { intranet_financeiro_tipos_cobanca: { ativo: @intranet_financeiro_tipos_cobanca.ativo, descricao: @intranet_financeiro_tipos_cobanca.descricao, sindical: @intranet_financeiro_tipos_cobanca.sindical, tipo_valor: @intranet_financeiro_tipos_cobanca.tipo_valor } }
    assert_redirected_to intranet_financeiro_tipos_cobanca_url(@intranet_financeiro_tipos_cobanca)
  end

  test "should destroy intranet_financeiro_tipos_cobanca" do
    assert_difference('Intranet::FinanceiroTiposCobanca.count', -1) do
      delete intranet_financeiro_tipos_cobanca_url(@intranet_financeiro_tipos_cobanca)
    end

    assert_redirected_to intranet_financeiro_tipos_cobancas_url
  end
end
