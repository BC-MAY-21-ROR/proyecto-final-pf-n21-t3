require "test_helper"

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(
      email:"dayala0@hotmail.com",
      name:"Derek",
      birthday:"01-01-2001",
      gender:"male",
      password:"dere2023",
      password_confirmation:"dere2023"
    )
  end

  test 'User should be valid' do
    assert @user.valid?
  end

  test 'User should not be valid because a field is empty' do
    @user.email = ""
    assert_not @user.valid?
  end

  test 'User should not be valid because passwords are diferent' do
    @user.password = "dere2023"
    @user.password_confirmation = "dere202"
    assert_not @user.valid?
  end

  test 'User should not be valid because email have to be unique' do
    user2 = User.new(
      email:"dayala0@hotmail.com",
      name:"Derek",
      birthday:"01-01-2001",
      gender:"male",
      password:"dere2",
      password_confirmation:"dere2"
    )
    assert_not user2.valid?
  end
end
