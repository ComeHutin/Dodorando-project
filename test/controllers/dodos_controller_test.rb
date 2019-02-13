require 'test_helper'

class DodosControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get dodos_home_url
    assert_response :success
  end

  test "should get index" do
    get dodos_index_url
    assert_response :success
  end

  test "should get show" do
    get dodos_show_url
    assert_response :success
  end

  test "should get new" do
    get dodos_new_url
    assert_response :success
  end

end
