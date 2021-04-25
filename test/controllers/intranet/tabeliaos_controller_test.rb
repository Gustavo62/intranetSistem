require "test_helper"

class Intranet::TabeliaosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @intranet_tabeliao = intranet_tabeliaos(:one)
  end

  test "should get index" do
    get intranet_tabeliaos_url
    assert_response :success
  end

  test "should get new" do
    get new_intranet_tabeliao_url
    assert_response :success
  end

  test "should create intranet_tabeliao" do
    assert_difference('Intranet::Tabeliao.count') do
      post intranet_tabeliaos_url, params: { intranet_tabeliao: { atual?: @intranet_tabeliao.atual?, cpf: @intranet_tabeliao.cpf, dt_final: @intranet_tabeliao.dt_final, dt_inicio: @intranet_tabeliao.dt_inicio, email: @intranet_tabeliao.email, nome: @intranet_tabeliao.nome, rg: @intranet_tabeliao.rg, telefone: @intranet_tabeliao.telefone, whatsapp: @intranet_tabeliao.whatsapp } }
    end

    assert_redirected_to intranet_tabeliao_url(Intranet::Tabeliao.last)
  end

  test "should show intranet_tabeliao" do
    get intranet_tabeliao_url(@intranet_tabeliao)
    assert_response :success
  end

  test "should get edit" do
    get edit_intranet_tabeliao_url(@intranet_tabeliao)
    assert_response :success
  end

  test "should update intranet_tabeliao" do
    patch intranet_tabeliao_url(@intranet_tabeliao), params: { intranet_tabeliao: { atual?: @intranet_tabeliao.atual?, cpf: @intranet_tabeliao.cpf, dt_final: @intranet_tabeliao.dt_final, dt_inicio: @intranet_tabeliao.dt_inicio, email: @intranet_tabeliao.email, nome: @intranet_tabeliao.nome, rg: @intranet_tabeliao.rg, telefone: @intranet_tabeliao.telefone, whatsapp: @intranet_tabeliao.whatsapp } }
    assert_redirected_to intranet_tabeliao_url(@intranet_tabeliao)
  end

  test "should destroy intranet_tabeliao" do
    assert_difference('Intranet::Tabeliao.count', -1) do
      delete intranet_tabeliao_url(@intranet_tabeliao)
    end

    assert_redirected_to intranet_tabeliaos_url
  end
end
