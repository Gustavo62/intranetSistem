require "test_helper"

class Intranet::ContribuicaosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @intranet_contribuicao = intranet_contribuicaos(:one)
  end

  test "should get index" do
    get intranet_contribuicaos_url
    assert_response :success
  end

  test "should get new" do
    get new_intranet_contribuicao_url
    assert_response :success
  end

  test "should create intranet_contribuicao" do
    assert_difference('Intranet::Contribuicao.count') do
      post intranet_contribuicaos_url, params: { intranet_contribuicao: { ativo: @intranet_contribuicao.ativo, descricao: @intranet_contribuicao.descricao } }
    end

    assert_redirected_to intranet_contribuicao_url(Intranet::Contribuicao.last)
  end

  test "should show intranet_contribuicao" do
    get intranet_contribuicao_url(@intranet_contribuicao)
    assert_response :success
  end

  test "should get edit" do
    get edit_intranet_contribuicao_url(@intranet_contribuicao)
    assert_response :success
  end

  test "should update intranet_contribuicao" do
    patch intranet_contribuicao_url(@intranet_contribuicao), params: { intranet_contribuicao: { ativo: @intranet_contribuicao.ativo, descricao: @intranet_contribuicao.descricao } }
    assert_redirected_to intranet_contribuicao_url(@intranet_contribuicao)
  end

  test "should destroy intranet_contribuicao" do
    assert_difference('Intranet::Contribuicao.count', -1) do
      delete intranet_contribuicao_url(@intranet_contribuicao)
    end

    assert_redirected_to intranet_contribuicaos_url
  end
end
