require "application_system_test_case"

class SwatchesTest < ApplicationSystemTestCase
  setup do
    @swatch = swatches(:one)
  end

  test "visiting the index" do
    visit swatches_url
    assert_selector "h1", text: "Swatches"
  end

  test "should create swatch" do
    visit swatches_url
    click_on "New swatch"

    fill_in "Name", with: @swatch.name
    fill_in "Project", with: @swatch.project_id
    click_on "Create Swatch"

    assert_text "Swatch was successfully created"
    click_on "Back"
  end

  test "should update Swatch" do
    visit swatch_url(@swatch)
    click_on "Edit this swatch", match: :first

    fill_in "Name", with: @swatch.name
    fill_in "Project", with: @swatch.project_id
    click_on "Update Swatch"

    assert_text "Swatch was successfully updated"
    click_on "Back"
  end

  test "should destroy Swatch" do
    visit swatch_url(@swatch)
    click_on "Destroy this swatch", match: :first

    assert_text "Swatch was successfully destroyed"
  end
end
