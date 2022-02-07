require "test_helper"

class Intranet::ChamadosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @intranet_chamado = intranet_chamados(:one)
  end

  test "should get index" do
    get intranet_chamados_url
    assert_response :success
  end

  test "should get new" do
    get new_intranet_chamado_url
    assert_response :success
  end

  test "should create intranet_chamado" do
    assert_difference('Intranet::Chamado.count') do
      post intranet_chamados_url, params: { intranet_chamado: { assunto: @intranet_chamado.assunto, intranet_associado_id: @intranet_chamado.intranet_associado_id, mensagem_pergunta: @intranet_chamado.mensagem_pergunta, mensagem_resposta: @intranet_chamado.mensagem_resposta, profissional_id: @intranet_chamado.profissional_id, visualizada: @intranet_chamado.visualizada, visualizada_at: @intranet_chamado.visualizada_at } }
    end

    assert_redirected_to intranet_chamado_url(Intranet::Chamado.last)
  end

  test "should show intranet_chamado" do
    get intranet_chamado_url(@intranet_chamado)
    assert_response :success
  end

  test "should get edit" do
    get edit_intranet_chamado_url(@intranet_chamado)
    assert_response :success
  end

  test "should update intranet_chamado" do
    patch intranet_chamado_url(@intranet_chamado), params: { intranet_chamado: { assunto: @intranet_chamado.assunto, intranet_associado_id: @intranet_chamado.intranet_associado_id, mensagem_pergunta: @intranet_chamado.mensagem_pergunta, mensagem_resposta: @intranet_chamado.mensagem_resposta, profissional_id: @intranet_chamado.profissional_id, visualizada: @intranet_chamado.visualizada, visualizada_at: @intranet_chamado.visualizada_at } }
    assert_redirected_to intranet_chamado_url(@intranet_chamado)
  end

  test "should destroy intranet_chamado" do
    assert_difference('Intranet::Chamado.count', -1) do
      delete intranet_chamado_url(@intranet_chamado)
    end

    assert_redirected_to intranet_chamados_url
  end
end
