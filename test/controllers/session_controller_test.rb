require 'test_helper'

class SessionControllerTest < ActionDispatch::IntegrationTest
  test "should get destroy" do
    get session_destroy_url
    assert_response :success
  end

end
