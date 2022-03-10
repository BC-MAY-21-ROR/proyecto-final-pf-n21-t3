require "test_helper"

class ProfileTest < ActiveSupport::TestCase

  setup do
    @user = User.create(
      email:"dayala0@hotmail.com", name:"Derek", birthday:"01-01-2001",
      gender:"male", password:"dere2023", password_confirmation:"dere2023"
    )

    @profile = Profile.new(
      phone_num: "3141443023", city: "Manzanillo", state: "Colima", country: "Mexico",
      description: "Hola como estas ? , te ves bien eh", user_id: @user.id, visible: true
    )
  end

  test 'Profile should be valid' do
    assert @profile.valid?
  end

  test 'Profile should not be valid because a field is empty' do
    @profile.state = ""
    assert_not @profile.valid?
  end

  test "Profile should not be valid because the user doesn't exits" do
    @profile.user_id = 5
    assert_not @profile.valid?
  end
end
