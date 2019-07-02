require 'test_helper'

class SessionControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get session_new_url
    assert_response :success
  end

  test "should get create" do
    assert_raises(NoMethodError) do
    	post session_create_url, xhr: true
    end
  end

  test "should get destroy" do
    assert_raises(NoMethodError) do
    	delete session_destroy_url, xhr: true
    end
  end
end
