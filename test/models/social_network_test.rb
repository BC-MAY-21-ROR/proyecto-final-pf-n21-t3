require "test_helper"

class SocialNetworkTest < ActiveSupport::TestCase
  setup do
    @user = User.create(
      email:"dayala0@hotmail.com", name:"Derek", birthday:"01-01-2001",
      gender:"male", password:"dere2023", password_confirmation:"dere2023"
    )

    @network = SocialNetwork.new(
      url:"https://www.facebook.com/derek.ayala.96/", network: "Facebook", user_id: @user.id
    )
  end

  test 'Social Network should be valid' do
    assert @network.valid?
  end

  test 'Social Network should not be valid because is empty' do
    @network.url = ""
    assert_not @network.valid?
  end

  test 'Social Network should not be valid because is not a valid url' do
    @network.url = "Facebook/perfil"
    assert_not @network.valid?
  end

  test "Social Network should not be valid because the user doesn't exits" do
    @network.user_id = 5
    assert_not @network.valid?
  end
end
