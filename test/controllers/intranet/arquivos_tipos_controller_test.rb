require "test_helper"

class Intranet::ArquivosTiposControllerTest < ActionDispatch::IntegrationTest
  setup do
    @intranet_arquivos_tipo = intranet_arquivos_tipos(:one)
  end

  test "should get index" do
    get intranet_arquivos_tipos_url
    assert_response :success
  end

  test "should get new" do
    get new_intranet_arquivos_tipo_url
    assert_response :success
  end

  test "should create intranet_arquivos_tipo" do
    assert_difference('Intranet::ArquivosTipo.count') do
      post intranet_arquivos_tipos_url, params: { intranet_arquivos_tipo: { ativo: @intranet_arquivos_tipo.ativo, descricao: @intranet_arquivos_tipo.descricao } }
    end

    assert_redirected_to intranet_arquivos_tipo_url(Intranet::ArquivosTipo.last)
  end

  test "should show intranet_arquivos_tipo" do
    get intranet_arquivos_tipo_url(@intranet_arquivos_tipo)
    assert_response :success
  end

  test "should get edit" do
    get edit_intranet_arquivos_tipo_url(@intranet_arquivos_tipo)
    assert_response :success
  end

  test "should update intranet_arquivos_tipo" do
    patch intranet_arquivos_tipo_url(@intranet_arquivos_tipo), params: { intranet_arquivos_tipo: { ativo: @intranet_arquivos_tipo.ativo, descricao: @intranet_arquivos_tipo.descricao } }
    assert_redirected_to intranet_arquivos_tipo_url(@intranet_arquivos_tipo)
  end

  test "should destroy intranet_arquivos_tipo" do
    assert_difference('Intranet::ArquivosTipo.count', -1) do
      delete intranet_arquivos_tipo_url(@intranet_arquivos_tipo)
    end

    assert_redirected_to intranet_arquivos_tipos_url
  end
end
