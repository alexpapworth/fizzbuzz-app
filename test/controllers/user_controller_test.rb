require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    post user_create_url, xhr: true
    assert_response :success
  end

end
