require "test_helper"

class Intranet::DepartamentosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @intranet_departamento = intranet_departamentos(:one)
  end

  test "should get index" do
    get intranet_departamentos_url
    assert_response :success
  end

  test "should get new" do
    get new_intranet_departamento_url
    assert_response :success
  end

  test "should create intranet_departamento" do
    assert_difference('Intranet::Departamento.count') do
      post intranet_departamentos_url, params: { intranet_departamento: { ativo: @intranet_departamento.ativo, descricao: @intranet_departamento.descricao } }
    end

    assert_redirected_to intranet_departamento_url(Intranet::Departamento.last)
  end

  test "should show intranet_departamento" do
    get intranet_departamento_url(@intranet_departamento)
    assert_response :success
  end

  test "should get edit" do
    get edit_intranet_departamento_url(@intranet_departamento)
    assert_response :success
  end

  test "should update intranet_departamento" do
    patch intranet_departamento_url(@intranet_departamento), params: { intranet_departamento: { ativo: @intranet_departamento.ativo, descricao: @intranet_departamento.descricao } }
    assert_redirected_to intranet_departamento_url(@intranet_departamento)
  end

  test "should destroy intranet_departamento" do
    assert_difference('Intranet::Departamento.count', -1) do
      delete intranet_departamento_url(@intranet_departamento)
    end

    assert_redirected_to intranet_departamentos_url
  end
end
