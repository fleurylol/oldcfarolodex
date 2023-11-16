require "test_helper"

class DeliveryControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get delivery_home_url
    assert_response :success
  end

  test "should get maps" do
    get delivery_maps_url
    assert_response :success
  end
end
