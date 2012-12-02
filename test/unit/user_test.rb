require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "a user should enter a first name" do
	user = User.new
	assert !user.save
	assert !user.errors[:first_name].empty?
  end

  test "a user should enter a last name" do
	user = User.new
	assert !user.save
	assert !user.errors[:last_name].empty?
  end

  test "a user should enter a profile name" do
	user = User.new
	assert !user.save
	assert !user.errors[:profile_name].empty?
  end

  test "a user should have a unique profile name" do
	user = User.new 
	user.profile_name = users(:willhc).profile_name
	assert !user.save
	assert !user.errors[:profile_name].empty?
  end
  
  test "a user should have a profile_name without spaces" do
  	user = User.new
  	user.profile_name = "Spaces Between Words"

  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  	assert user.errors[:profile_name].include?("Must be formatted correctly.")
  end

  test "a user can sign up if they have a correct profile name" do
    user = User.new(first_name: 'Tree', last_name: 'Tester', email: 'test@test.qa')
    user.password = user.password_confirmation = "testypassword"
    user.profile_name = "CompletelyValid_123"
    assert user.valid?, user.errors.full_messages.inspect
  end
end
