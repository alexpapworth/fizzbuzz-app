require 'test_helper'

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get root_url
    assert_response :success
  end

  test "should get page size" do
  	assert_raises(ZeroDivisionError) do
    	get page_size_path, xhr: true
    end
  end

end
