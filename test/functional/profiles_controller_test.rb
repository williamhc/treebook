require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  test "should get show" do
    get :show, id: users(:willhc).profile_name
    assert_response :success
    assert_template 'profiles/show'
  end

  test "should 404 is profile not found" do
	get :show, id: 'not found'
	assert_response :not_found
  end

  test "assigns a profile when viewing a profile" do
  	get :show, id: users(:willhc).profile_name
  	assert assigns(:user)
  	assert_not_empty assigns(:statuses)
  end

  test "only shows a user's own statuses" do
  	get :show, id: users(:willhc).profile_name
  	assigns(:statuses).each do |status|
  		assert_equal users(:willhc), status.user
    end
  end

end
