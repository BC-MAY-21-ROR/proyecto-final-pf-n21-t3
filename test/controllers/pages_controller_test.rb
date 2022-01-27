require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get feed" do
    get pages_feed_url
    assert_response :success
  end
end
