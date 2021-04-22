require "test_helper"

class Intranet::RegiaosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @intranet_regiao = intranet_regiaos(:one)
  end

  test "should get index" do
    get intranet_regiaos_url
    assert_response :success
  end

  test "should get new" do
    get new_intranet_regiao_url
    assert_response :success
  end

  test "should create intranet_regiao" do
    assert_difference('Intranet::Regiao.count') do
      post intranet_regiaos_url, params: { intranet_regiao: { ativo: @intranet_regiao.ativo, descricao: @intranet_regiao.descricao } }
    end

    assert_redirected_to intranet_regiao_url(Intranet::Regiao.last)
  end

  test "should show intranet_regiao" do
    get intranet_regiao_url(@intranet_regiao)
    assert_response :success
  end

  test "should get edit" do
    get edit_intranet_regiao_url(@intranet_regiao)
    assert_response :success
  end

  test "should update intranet_regiao" do
    patch intranet_regiao_url(@intranet_regiao), params: { intranet_regiao: { ativo: @intranet_regiao.ativo, descricao: @intranet_regiao.descricao } }
    assert_redirected_to intranet_regiao_url(@intranet_regiao)
  end

  test "should destroy intranet_regiao" do
    assert_difference('Intranet::Regiao.count', -1) do
      delete intranet_regiao_url(@intranet_regiao)
    end

    assert_redirected_to intranet_regiaos_url
  end
end
