require "test_helper"

class SwatchesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @swatch = swatches(:one)
  end

  test "should get index" do
    get swatches_url
    assert_response :success
  end

  test "should get new" do
    get new_swatch_url
    assert_response :success
  end

  test "should create swatch" do
    assert_difference("Swatch.count") do
      post swatches_url, params: { swatch: { name: @swatch.name, project_id: @swatch.project_id } }
    end

    assert_redirected_to swatch_url(Swatch.last)
  end

  test "should show swatch" do
    get swatch_url(@swatch)
    assert_response :success
  end

  test "should get edit" do
    get edit_swatch_url(@swatch)
    assert_response :success
  end

  test "should update swatch" do
    patch swatch_url(@swatch), params: { swatch: { name: @swatch.name, project_id: @swatch.project_id } }
    assert_redirected_to swatch_url(@swatch)
  end

  test "should destroy swatch" do
    assert_difference("Swatch.count", -1) do
      delete swatch_url(@swatch)
    end

    assert_redirected_to swatches_url
  end
end
