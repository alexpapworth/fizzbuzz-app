require 'test_helper'

class FavouriteTest < ActiveSupport::TestCase
  test "should not save favourite without number_id" do
    favourite = Favourite.new
  	assert_not favourite.save, "Saved the favourite without a number_id"
  end

  test "should not save favourite without user_id" do
    favourite = Favourite.new
  	assert_not favourite.save, "Saved the favourite without a user_id"
  end
end
