require 'test_helper'

class FavouriteControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get favourite_create_url
    assert_response :success
  end

  test "should get destroy" do
    get favourite_destroy_url
    assert_response :success
  end

end
