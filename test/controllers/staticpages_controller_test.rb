require 'test_helper'

class StaticpagesControllerTest < ActionDispatch::IntegrationTest
  test "should get bookingpage" do
    get staticpages_bookingpage_url
    assert_response :success
  end

  test "should get addroom" do
    get staticpages_addroom_url
    assert_response :success
  end

  test "should get userprofile" do
    get staticpages_userprofile_url
    assert_response :success
  end

  test "should get blog" do
    get staticpages_blog_url
    assert_response :success
  end

  test "should get contact" do
    get staticpages_contact_url
    assert_response :success
  end

end
