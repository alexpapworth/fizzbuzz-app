require 'test_helper'

class SessionTest < ActiveSupport::TestCase
  test "should not save session without auth_token" do
  	user = User.create(name: "TestName")
    session = Session.new( user_id: user.id )
  	assert_not session.save, "Saved the session without an auth_token"
  end

  test "should not save session with duplicate auth_token" do
    user = User.create(name: "TestName")
    session = Session.create( user_id: user.id, auth_token: "duplicate_auth_token" )
    user2 = User.create(name: "TestName2")
    session2 = Session.new( user_id: user2.id, auth_token: "duplicate_auth_token" )
  	assert_not session2.save, "Saved the session with duplicate auth_token"
  end
end
