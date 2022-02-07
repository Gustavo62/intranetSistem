require "test_helper"

class Intranet::PresencsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @intranet_presenc = intranet_presencs(:one)
  end

  test "should get index" do
    get intranet_presencs_url
    assert_response :success
  end

  test "should get new" do
    get new_intranet_presenc_url
    assert_response :success
  end

  test "should create intranet_presenc" do
    assert_difference('Intranet::Presenc.count') do
      post intranet_presencs_url, params: { intranet_presenc: { intranet_associado_id: @intranet_presenc.intranet_associado_id, m_id: @intranet_presenc.model_id, model_name: @intranet_presenc.model_name } }
    end

    assert_redirected_to intranet_presenc_url(Intranet::Presenc.last)
  end

  test "should show intranet_presenc" do
    get intranet_presenc_url(@intranet_presenc)
    assert_response :success
  end

  test "should get edit" do
    get edit_intranet_presenc_url(@intranet_presenc)
    assert_response :success
  end

  test "should update intranet_presenc" do
    patch intranet_presenc_url(@intranet_presenc), params: { intranet_presenc: { intranet_associado_id: @intranet_presenc.intranet_associado_id, m_id: @intranet_presenc.model_id, model_name: @intranet_presenc.model_name } }
    assert_redirected_to intranet_presenc_url(@intranet_presenc)
  end

  test "should destroy intranet_presenc" do
    assert_difference('Intranet::Presenc.count', -1) do
      delete intranet_presenc_url(@intranet_presenc)
    end

    assert_redirected_to intranet_presencs_url
  end
end
