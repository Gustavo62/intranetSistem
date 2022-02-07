require "application_system_test_case"

class Intranet::ReunionsTest < ApplicationSystemTestCase
  setup do
    @intranet_reunion = intranet_reunions(:one)
  end

  test "visiting the index" do
    visit intranet_reunions_url
    assert_selector "h1", text: "Intranet/Reunions"
  end

  test "creating a Reunion" do
    visit intranet_reunions_url
    click_on "New Intranet/Reunion"

    fill_in "Assunto", with: @intranet_reunion.assunto
    fill_in "Data", with: @intranet_reunion.data
    fill_in "Intranet associado", with: @intranet_reunion.intranet_associado_id
    fill_in "Local", with: @intranet_reunion.local
    click_on "Create Reunion"

    assert_text "Reunion was successfully created"
    click_on "Back"
  end

  test "updating a Reunion" do
    visit intranet_reunions_url
    click_on "Edit", match: :first

    fill_in "Assunto", with: @intranet_reunion.assunto
    fill_in "Data", with: @intranet_reunion.data
    fill_in "Intranet associado", with: @intranet_reunion.intranet_associado_id
    fill_in "Local", with: @intranet_reunion.local
    click_on "Update Reunion"

    assert_text "Reunion was successfully updated"
    click_on "Back"
  end

  test "destroying a Reunion" do
    visit intranet_reunions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Reunion was successfully destroyed"
  end
end
