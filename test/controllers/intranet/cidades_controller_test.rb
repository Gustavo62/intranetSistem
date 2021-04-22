require "test_helper"

class Intranet::CidadesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @intranet_cidade = intranet_cidades(:one)
  end

  test "should get index" do
    get intranet_cidades_url
    assert_response :success
  end

  test "should get new" do
    get new_intranet_cidade_url
    assert_response :success
  end

  test "should create intranet_cidade" do
    assert_difference('Intranet::Cidade.count') do
      post intranet_cidades_url, params: { intranet_cidade: { descricao: @intranet_cidade.descricao, estado: @intranet_cidade.estado } }
    end

    assert_redirected_to intranet_cidade_url(Intranet::Cidade.last)
  end

  test "should show intranet_cidade" do
    get intranet_cidade_url(@intranet_cidade)
    assert_response :success
  end

  test "should get edit" do
    get edit_intranet_cidade_url(@intranet_cidade)
    assert_response :success
  end

  test "should update intranet_cidade" do
    patch intranet_cidade_url(@intranet_cidade), params: { intranet_cidade: { descricao: @intranet_cidade.descricao, estado: @intranet_cidade.estado } }
    assert_redirected_to intranet_cidade_url(@intranet_cidade)
  end

  test "should destroy intranet_cidade" do
    assert_difference('Intranet::Cidade.count', -1) do
      delete intranet_cidade_url(@intranet_cidade)
    end

    assert_redirected_to intranet_cidades_url
  end
end
