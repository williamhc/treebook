require 'test_helper'

class CustomRoutesTestTest < ActionDispatch::IntegrationTest
	test "that the /login route opens the login page" do
		get '/login'
		assert_response :success
	end

	test "that the /register route opens the registration page" do
		get '/register'
		assert_response :success
	end

end
