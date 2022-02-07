require "test_helper"

class Intranet::PerguntsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @intranet_pergunt = intranet_pergunts(:one)
  end

  test "should get index" do
    get intranet_pergunts_url
    assert_response :success
  end

  test "should get new" do
    get new_intranet_pergunt_url
    assert_response :success
  end

  test "should create intranet_pergunt" do
    assert_difference('Intranet::Pergunt.count') do
      post intranet_pergunts_url, params: { intranet_pergunt: { assunto: @intranet_pergunt.assunto, intranet_associado_id: @intranet_pergunt.intranet_associado_id, mensagem_pergunta: @intranet_pergunt.mensagem_pergunta, mensagem_resposta: @intranet_pergunt.mensagem_resposta, profissional_id: @intranet_pergunt.profissional_id, tipo: @intranet_pergunt.tipo } }
    end

    assert_redirected_to intranet_pergunt_url(Intranet::Pergunt.last)
  end

  test "should show intranet_pergunt" do
    get intranet_pergunt_url(@intranet_pergunt)
    assert_response :success
  end

  test "should get edit" do
    get edit_intranet_pergunt_url(@intranet_pergunt)
    assert_response :success
  end

  test "should update intranet_pergunt" do
    patch intranet_pergunt_url(@intranet_pergunt), params: { intranet_pergunt: { assunto: @intranet_pergunt.assunto, intranet_associado_id: @intranet_pergunt.intranet_associado_id, mensagem_pergunta: @intranet_pergunt.mensagem_pergunta, mensagem_resposta: @intranet_pergunt.mensagem_resposta, profissional_id: @intranet_pergunt.profissional_id, tipo: @intranet_pergunt.tipo } }
    assert_redirected_to intranet_pergunt_url(@intranet_pergunt)
  end

  test "should destroy intranet_pergunt" do
    assert_difference('Intranet::Pergunt.count', -1) do
      delete intranet_pergunt_url(@intranet_pergunt)
    end

    assert_redirected_to intranet_pergunts_url
  end
end
