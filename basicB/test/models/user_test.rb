require "test_helper"

class UserTest < ActiveSupport::TestCase
  # devise checks itself better than the programmer can, recommended test only
  # ...what I rely on for rest of records
  test 'valid user' do
    user = User.new(email: 'john@example.com', password: "123456", password_confirmation: "123456")
    assert user.valid?
  end

  #  This passes whether or not validation is in place - Stackoverflow & issues
  #  ... in github state there's a good reason devise setup this way & don't worry
  test 'invalid without email' do
    user = User.new()
    refute user.valid?, 'user is valid without an email'
    assert_not_nil user.errors[:email], 'no validation error for name present'
  end

end