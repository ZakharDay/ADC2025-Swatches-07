require "test_helper"

class FillsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fill = fills(:one)
  end

  test "should get index" do
    get fills_url
    assert_response :success
  end

  test "should get new" do
    get new_fill_url
    assert_response :success
  end

  test "should create fill" do
    assert_difference("Fill.count") do
      post fills_url, params: { fill: { color: @fill.color, name: @fill.name, swatch_id: @fill.swatch_id } }
    end

    assert_redirected_to fill_url(Fill.last)
  end

  test "should show fill" do
    get fill_url(@fill)
    assert_response :success
  end

  test "should get edit" do
    get edit_fill_url(@fill)
    assert_response :success
  end

  test "should update fill" do
    patch fill_url(@fill), params: { fill: { color: @fill.color, name: @fill.name, swatch_id: @fill.swatch_id } }
    assert_redirected_to fill_url(@fill)
  end

  test "should destroy fill" do
    assert_difference("Fill.count", -1) do
      delete fill_url(@fill)
    end

    assert_redirected_to fills_url
  end
end
