require "test_helper"

class Intranet::ArquivosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @intranet_arquivo = intranet_arquivos(:one)
  end

  test "should get index" do
    get intranet_arquivos_url
    assert_response :success
  end

  test "should get new" do
    get new_intranet_arquivo_url
    assert_response :success
  end

  test "should create intranet_arquivo" do
    assert_difference('Intranet::Arquivo.count') do
      post intranet_arquivos_url, params: { intranet_arquivo: { ativo: @intranet_arquivo.ativo, descricao: @intranet_arquivo.descricao, intranet_arquivos_tipo_id: @intranet_arquivo.intranet_arquivos_tipo_id, intranet_atividade_id: @intranet_arquivo.intranet_atividade_id, intranet_cartorio_id: @intranet_arquivo.intranet_cartorio_id } }
    end

    assert_redirected_to intranet_arquivo_url(Intranet::Arquivo.last)
  end

  test "should show intranet_arquivo" do
    get intranet_arquivo_url(@intranet_arquivo)
    assert_response :success
  end

  test "should get edit" do
    get edit_intranet_arquivo_url(@intranet_arquivo)
    assert_response :success
  end

  test "should update intranet_arquivo" do
    patch intranet_arquivo_url(@intranet_arquivo), params: { intranet_arquivo: { ativo: @intranet_arquivo.ativo, descricao: @intranet_arquivo.descricao, intranet_arquivos_tipo_id: @intranet_arquivo.intranet_arquivos_tipo_id, intranet_atividade_id: @intranet_arquivo.intranet_atividade_id, intranet_cartorio_id: @intranet_arquivo.intranet_cartorio_id } }
    assert_redirected_to intranet_arquivo_url(@intranet_arquivo)
  end

  test "should destroy intranet_arquivo" do
    assert_difference('Intranet::Arquivo.count', -1) do
      delete intranet_arquivo_url(@intranet_arquivo)
    end

    assert_redirected_to intranet_arquivos_url
  end
end
