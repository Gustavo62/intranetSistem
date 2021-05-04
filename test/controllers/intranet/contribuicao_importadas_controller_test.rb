require "test_helper"

class Intranet::ContribuicaoImportadasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @intranet_contribuicao_importada = intranet_contribuicao_importadas(:one)
  end

  test "should get index" do
    get intranet_contribuicao_importadas_url
    assert_response :success
  end

  test "should get new" do
    get new_intranet_contribuicao_importada_url
    assert_response :success
  end

  test "should create intranet_contribuicao_importada" do
    assert_difference('Intranet::ContribuicaoImportada.count') do
      post intranet_contribuicao_importadas_url, params: { intranet_contribuicao_importada: { ano: @intranet_contribuicao_importada.ano, documento: @intranet_contribuicao_importada.documento } }
    end

    assert_redirected_to intranet_contribuicao_importada_url(Intranet::ContribuicaoImportada.last)
  end

  test "should show intranet_contribuicao_importada" do
    get intranet_contribuicao_importada_url(@intranet_contribuicao_importada)
    assert_response :success
  end

  test "should get edit" do
    get edit_intranet_contribuicao_importada_url(@intranet_contribuicao_importada)
    assert_response :success
  end

  test "should update intranet_contribuicao_importada" do
    patch intranet_contribuicao_importada_url(@intranet_contribuicao_importada), params: { intranet_contribuicao_importada: { ano: @intranet_contribuicao_importada.ano, documento: @intranet_contribuicao_importada.documento } }
    assert_redirected_to intranet_contribuicao_importada_url(@intranet_contribuicao_importada)
  end

  test "should destroy intranet_contribuicao_importada" do
    assert_difference('Intranet::ContribuicaoImportada.count', -1) do
      delete intranet_contribuicao_importada_url(@intranet_contribuicao_importada)
    end

    assert_redirected_to intranet_contribuicao_importadas_url
  end
end
