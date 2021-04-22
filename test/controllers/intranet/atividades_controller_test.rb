require "test_helper"

class Intranet::AtividadesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @intranet_atividade = intranet_atividades(:one)
  end

  test "should get index" do
    get intranet_atividades_url
    assert_response :success
  end

  test "should get new" do
    get new_intranet_atividade_url
    assert_response :success
  end

  test "should create intranet_atividade" do
    assert_difference('Intranet::Atividade.count') do
      post intranet_atividades_url, params: { intranet_atividade: { ativo: @intranet_atividade.ativo, descricao: @intranet_atividade.descricao } }
    end

    assert_redirected_to intranet_atividade_url(Intranet::Atividade.last)
  end

  test "should show intranet_atividade" do
    get intranet_atividade_url(@intranet_atividade)
    assert_response :success
  end

  test "should get edit" do
    get edit_intranet_atividade_url(@intranet_atividade)
    assert_response :success
  end

  test "should update intranet_atividade" do
    patch intranet_atividade_url(@intranet_atividade), params: { intranet_atividade: { ativo: @intranet_atividade.ativo, descricao: @intranet_atividade.descricao } }
    assert_redirected_to intranet_atividade_url(@intranet_atividade)
  end

  test "should destroy intranet_atividade" do
    assert_difference('Intranet::Atividade.count', -1) do
      delete intranet_atividade_url(@intranet_atividade)
    end

    assert_redirected_to intranet_atividades_url
  end
end
