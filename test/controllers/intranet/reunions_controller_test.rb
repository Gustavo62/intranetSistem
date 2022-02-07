require "test_helper"

class Intranet::ReunionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @intranet_reunion = intranet_reunions(:one)
  end

  test "should get index" do
    get intranet_reunions_url
    assert_response :success
  end

  test "should get new" do
    get new_intranet_reunion_url
    assert_response :success
  end

  test "should create intranet_reunion" do
    assert_difference('Intranet::Reunion.count') do
      post intranet_reunions_url, params: { intranet_reunion: { assunto: @intranet_reunion.assunto, data: @intranet_reunion.data, intranet_associado_id: @intranet_reunion.intranet_associado_id, local: @intranet_reunion.local } }
    end

    assert_redirected_to intranet_reunion_url(Intranet::Reunion.last)
  end

  test "should show intranet_reunion" do
    get intranet_reunion_url(@intranet_reunion)
    assert_response :success
  end

  test "should get edit" do
    get edit_intranet_reunion_url(@intranet_reunion)
    assert_response :success
  end

  test "should update intranet_reunion" do
    patch intranet_reunion_url(@intranet_reunion), params: { intranet_reunion: { assunto: @intranet_reunion.assunto, data: @intranet_reunion.data, intranet_associado_id: @intranet_reunion.intranet_associado_id, local: @intranet_reunion.local } }
    assert_redirected_to intranet_reunion_url(@intranet_reunion)
  end

  test "should destroy intranet_reunion" do
    assert_difference('Intranet::Reunion.count', -1) do
      delete intranet_reunion_url(@intranet_reunion)
    end

    assert_redirected_to intranet_reunions_url
  end
end
