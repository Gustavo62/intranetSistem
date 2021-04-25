require "test_helper"

class Intranet::BoletosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @intranet_boleto = intranet_boletos(:one)
  end

  test "should get index" do
    get intranet_boletos_url
    assert_response :success
  end

  test "should get new" do
    get new_intranet_boleto_url
    assert_response :success
  end

  test "should create intranet_boleto" do
    assert_difference('Intranet::Boleto.count') do
      post intranet_boletos_url, params: { intranet_boleto: { apenas_titular: @intranet_boleto.apenas_titular, descricao: @intranet_boleto.descricao, forma_cobranca: @intranet_boleto.forma_cobranca, intranet_atividade: @intranet_boleto.intranet_atividade, intranet_cartorio_id: @intranet_boleto.intranet_cartorio_id, intranet_contribuicao_id: @intranet_boleto.intranet_contribuicao_id, intranet_entrancias_id: @intranet_boleto.intranet_entrancias_id, intranet_financeiro_portadores: @intranet_boleto.intranet_financeiro_portadores, intranet_financeiro_tipos_cobranca_id: @intranet_boleto.intranet_financeiro_tipos_cobranca_id, intranet_regiao_id: @intranet_boleto.intranet_regiao_id, observacao_email: @intranet_boleto.observacao_email, valor: @intranet_boleto.valor, vencimento: @intranet_boleto.vencimento } }
    end

    assert_redirected_to intranet_boleto_url(Intranet::Boleto.last)
  end

  test "should show intranet_boleto" do
    get intranet_boleto_url(@intranet_boleto)
    assert_response :success
  end

  test "should get edit" do
    get edit_intranet_boleto_url(@intranet_boleto)
    assert_response :success
  end

  test "should update intranet_boleto" do
    patch intranet_boleto_url(@intranet_boleto), params: { intranet_boleto: { apenas_titular: @intranet_boleto.apenas_titular, descricao: @intranet_boleto.descricao, forma_cobranca: @intranet_boleto.forma_cobranca, intranet_atividade: @intranet_boleto.intranet_atividade, intranet_cartorio_id: @intranet_boleto.intranet_cartorio_id, intranet_contribuicao_id: @intranet_boleto.intranet_contribuicao_id, intranet_entrancias_id: @intranet_boleto.intranet_entrancias_id, intranet_financeiro_portadores: @intranet_boleto.intranet_financeiro_portadores, intranet_financeiro_tipos_cobranca_id: @intranet_boleto.intranet_financeiro_tipos_cobranca_id, intranet_regiao_id: @intranet_boleto.intranet_regiao_id, observacao_email: @intranet_boleto.observacao_email, valor: @intranet_boleto.valor, vencimento: @intranet_boleto.vencimento } }
    assert_redirected_to intranet_boleto_url(@intranet_boleto)
  end

  test "should destroy intranet_boleto" do
    assert_difference('Intranet::Boleto.count', -1) do
      delete intranet_boleto_url(@intranet_boleto)
    end

    assert_redirected_to intranet_boletos_url
  end
end
