require "test_helper"

class UserTest < ActiveSupport::TestCase

  test 'User should be valid' do
    @user = User.new(
      email:"dayala0@hotmail.com",
      name:"Derek",
      birthday:"01-01-2001",
      gender:"male",
      password:"dere2023",
      password_confirmation:"dere2023"
    )
    assert @user.valid?
  end

  test 'User should not be valid because all fields are empty' do
    @user = User.new(
      email:"",
      name:"",
      birthday:"",
      gender:"",
      password:"",
      password_confirmation:""
    )
    assert_not @user.valid?
  end

  test 'User should not be valid because passwords are diferent' do
    @user = User.new(
      email:"dayala0@hotmail.com",
      name:"Derek",
      birthday:"01-01-2001",
      gender:"male",
      password:"dere2023",
      password_confirmation:"dere202"
    )
    assert_not @user.valid?
  end

  test 'User should not be valid because email have to be unique' do
    @user1 = User.new(
      email:"dayala0@hotmail.com",
      name:"Derek",
      birthday:"01-01-2001",
      gender:"male",
      password:"dere2",
      password_confirmation:"dere2"
    ).save
    @user2 = User.new(email:"dayala0@hotmail.com")
    assert_not @user2.valid?
  end
end
