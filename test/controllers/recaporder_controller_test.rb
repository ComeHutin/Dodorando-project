require 'test_helper'

class RecaporderControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get recaporder_index_url
    assert_response :success
  end

end
