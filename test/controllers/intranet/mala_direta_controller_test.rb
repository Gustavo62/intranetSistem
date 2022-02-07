require "test_helper"

class Intranet::MalaDiretaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @intranet_mala_diretum = intranet_mala_direta(:one)
  end

  test "should get index" do
    get intranet_mala_direta_url
    assert_response :success
  end

  test "should get new" do
    get new_intranet_mala_diretum_url
    assert_response :success
  end

  test "should create intranet_mala_diretum" do
    assert_difference('Intranet::MalaDiretum.count') do
      post intranet_mala_direta_url, params: { intranet_mala_diretum: { assunto: @intranet_mala_diretum.assunto, destinatario: @intranet_mala_diretum.destinatario, intranet_atividade_id: @intranet_mala_diretum.intranet_atividade_id, intranet_cartorio_id: @intranet_mala_diretum.intranet_cartorio_id, intranet_contribuicao_id: @intranet_mala_diretum.intranet_contribuicao_id, intranet_entrancium_id: @intranet_mala_diretum.intranet_entrancium_id, intranet_regiao_id: @intranet_mala_diretum.intranet_regiao_id, layout: @intranet_mala_diretum.layout } }
    end

    assert_redirected_to intranet_mala_diretum_url(Intranet::MalaDiretum.last)
  end

  test "should show intranet_mala_diretum" do
    get intranet_mala_diretum_url(@intranet_mala_diretum)
    assert_response :success
  end

  test "should get edit" do
    get edit_intranet_mala_diretum_url(@intranet_mala_diretum)
    assert_response :success
  end

  test "should update intranet_mala_diretum" do
    patch intranet_mala_diretum_url(@intranet_mala_diretum), params: { intranet_mala_diretum: { assunto: @intranet_mala_diretum.assunto, destinatario: @intranet_mala_diretum.destinatario, intranet_atividade_id: @intranet_mala_diretum.intranet_atividade_id, intranet_cartorio_id: @intranet_mala_diretum.intranet_cartorio_id, intranet_contribuicao_id: @intranet_mala_diretum.intranet_contribuicao_id, intranet_entrancium_id: @intranet_mala_diretum.intranet_entrancium_id, intranet_regiao_id: @intranet_mala_diretum.intranet_regiao_id, layout: @intranet_mala_diretum.layout } }
    assert_redirected_to intranet_mala_diretum_url(@intranet_mala_diretum)
  end

  test "should destroy intranet_mala_diretum" do
    assert_difference('Intranet::MalaDiretum.count', -1) do
      delete intranet_mala_diretum_url(@intranet_mala_diretum)
    end

    assert_redirected_to intranet_mala_direta_url
  end
end
