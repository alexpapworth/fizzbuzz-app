require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should not save user without name" do
    user = User.new
  	assert_not user.save, "Saved the user without a name"
  end

  test "should delete user favourites upon deleting user" do
    user = User.create(name: "TestName")
	  Number.where( id: 111, result: "Fizz" ).first_or_create
	  favourite = Favourite.create( number_id: 111, user_id: user.id )

	  assert user.destroy, "Unable to delete user, possibly because of favourite dependancies"
	  assert_nil Favourite.find_by_id( favourite.id ), "Deleted user, but favourite still exists"
  end
end
