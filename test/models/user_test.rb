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
end
