require 'test_helper'

class BedroomsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get bedrooms_show_url
    assert_response :success
  end

end
