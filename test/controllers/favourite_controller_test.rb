require 'test_helper'

class FavouriteControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    post favourite_create_url, xhr: true
    assert_response :success
  end

  test "should get destroy" do
    assert_raises(NoMethodError) do
    	delete favourite_destroy_url, xhr: true
    end
  end

end
