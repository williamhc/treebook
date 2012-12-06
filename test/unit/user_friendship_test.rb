require 'test_helper'

class UserFriendshipTest < ActiveSupport::TestCase
	should belong_to(:user)
	should belong_to(:friend)

	test "that friendships can be created" do
		UserFriendship.create user: users(:willhc), friend: users(:macjagga)
	end
end
