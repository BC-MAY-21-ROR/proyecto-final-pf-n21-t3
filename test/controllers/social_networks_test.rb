require 'test_helper'

class SocialNetworksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create(
      email: "dayala0@hotmail.com", name: "Derek", birthday: "01-01-2001",
      gender: "male", password: "dere2023", password_confirmation: "dere2023"
    )
    post new_user_session_url, params: { user: { email: "dayala0@hotmail.com", password: "dere2023" } }
    @profile = Profile.create(
      phone_num: "3141443023", city: "Manzanillo", state: "Colima", country: "Mexico",
      description: "Hola como estas ? , te ves bien eh", user_id: @user.id, visible: true
    )
    @network = SocialNetwork.create(
      url: "https://www.instagram.com/capitan_apple/?hl=es-la", network: "Instagram", user_id: @user.id
    )
  end

  test "Should get new" do
    get new_social_network_url
    assert_response :success
  end

  test "Should create a social network" do
    assert_difference "SocialNetwork.count", 1 do
      post social_networks_url, params: {
        social_network: {
          url: "https://www.facebook.com/derek.ayala.96/", network: "Facebook"
        }
      }
    end
    assert_redirected_to profile_url(@profile.user_id)
  end

  test "Should delete a social network" do
    assert_difference "SocialNetwork.count", -1 do
      delete social_network_url(@network)
    end
  end
end
