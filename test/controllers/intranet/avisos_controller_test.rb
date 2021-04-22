require "test_helper"

class Intranet::AvisosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @intranet_aviso = intranet_avisos(:one)
  end

  test "should get index" do
    get intranet_avisos_url
    assert_response :success
  end

  test "should get new" do
    get new_intranet_aviso_url
    assert_response :success
  end

  test "should create intranet_aviso" do
    assert_difference('Intranet::Aviso.count') do
      post intranet_avisos_url, params: { intranet_aviso: { atividade_id: @intranet_aviso.atividade_id, ativo: @intranet_aviso.ativo, descricao: @intranet_aviso.descricao } }
    end

    assert_redirected_to intranet_aviso_url(Intranet::Aviso.last)
  end

  test "should show intranet_aviso" do
    get intranet_aviso_url(@intranet_aviso)
    assert_response :success
  end

  test "should get edit" do
    get edit_intranet_aviso_url(@intranet_aviso)
    assert_response :success
  end

  test "should update intranet_aviso" do
    patch intranet_aviso_url(@intranet_aviso), params: { intranet_aviso: { atividade_id: @intranet_aviso.atividade_id, ativo: @intranet_aviso.ativo, descricao: @intranet_aviso.descricao } }
    assert_redirected_to intranet_aviso_url(@intranet_aviso)
  end

  test "should destroy intranet_aviso" do
    assert_difference('Intranet::Aviso.count', -1) do
      delete intranet_aviso_url(@intranet_aviso)
    end

    assert_redirected_to intranet_avisos_url
  end
end
