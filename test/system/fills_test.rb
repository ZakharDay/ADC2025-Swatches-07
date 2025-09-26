require "application_system_test_case"

class FillsTest < ApplicationSystemTestCase
  setup do
    @fill = fills(:one)
  end

  test "visiting the index" do
    visit fills_url
    assert_selector "h1", text: "Fills"
  end

  test "should create fill" do
    visit fills_url
    click_on "New fill"

    fill_in "Color", with: @fill.color
    fill_in "Name", with: @fill.name
    fill_in "Swatch", with: @fill.swatch_id
    click_on "Create Fill"

    assert_text "Fill was successfully created"
    click_on "Back"
  end

  test "should update Fill" do
    visit fill_url(@fill)
    click_on "Edit this fill", match: :first

    fill_in "Color", with: @fill.color
    fill_in "Name", with: @fill.name
    fill_in "Swatch", with: @fill.swatch_id
    click_on "Update Fill"

    assert_text "Fill was successfully updated"
    click_on "Back"
  end

  test "should destroy Fill" do
    visit fill_url(@fill)
    click_on "Destroy this fill", match: :first

    assert_text "Fill was successfully destroyed"
  end
end
