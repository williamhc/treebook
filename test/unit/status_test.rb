require 'test_helper'

class StatusTest < ActiveSupport::TestCase
  test "that a status requires content" do
  	status = Status.new
  	assert !status.save
  	assert !status.errors[:content].empty?
  end

  test "status content should be at least 2 characters" do
  	status = Status.new
  	status.content = "o"
  	assert !status.save
  	assert !status.errors[:content].empty?
  end

  test "statuses require a user id" do
  	status = Status.new
  	status.content = "Hello"
  	assert !status.save
  	assert !status.errors[:user_id].empty?
  end

end
