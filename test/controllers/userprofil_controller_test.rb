require 'test_helper'

class UserprofilControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get userprofil_show_url
    assert_response :success
  end

end
