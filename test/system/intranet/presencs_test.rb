require "application_system_test_case"

class Intranet::PresencsTest < ApplicationSystemTestCase
  setup do
    @intranet_presenc = intranet_presencs(:one)
  end

  test "visiting the index" do
    visit intranet_presencs_url
    assert_selector "h1", text: "Intranet/Presencs"
  end

  test "creating a Presenc" do
    visit intranet_presencs_url
    click_on "New Intranet/Presenc"

    fill_in "Intranet associado", with: @intranet_presenc.intranet_associado_id
    fill_in "Model", with: @intranet_presenc.model_id
    fill_in "Model name", with: @intranet_presenc.model_name
    click_on "Create Presenc"

    assert_text "Presenc was successfully created"
    click_on "Back"
  end

  test "updating a Presenc" do
    visit intranet_presencs_url
    click_on "Edit", match: :first

    fill_in "Intranet associado", with: @intranet_presenc.intranet_associado_id
    fill_in "Model", with: @intranet_presenc.model_id
    fill_in "Model name", with: @intranet_presenc.model_name
    click_on "Update Presenc"

    assert_text "Presenc was successfully updated"
    click_on "Back"
  end

  test "destroying a Presenc" do
    visit intranet_presencs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Presenc was successfully destroyed"
  end
end
