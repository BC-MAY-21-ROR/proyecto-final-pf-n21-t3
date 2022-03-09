require 'test_helper'

class ProfilesControllerTest < ActionDispatch::IntegrationTest
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
  end

  test "Should get index" do
    get profiles_url
    assert_response :success
  end

  test "Should get new" do
    get new_profile_url
    assert_response :success
  end

  test "Should get show" do
    get profile_url(@profile.user_id)
    assert_response :success
  end

  test "Should get edit" do
    get edit_profile_url(@profile.user_id)
    assert_response :success
  end

  test "Should create" do
    assert_difference "Profile.count", 1 do
      post profiles_url, params: {
        profile: {
          phone_num: "3141443023", city: "Manzanillo", state: "Colima", country: "Mexico",
          description: "Hola como estas ? , te ves bien eh", visible: true
        }
      }
    end
    assert_redirected_to profile_url(Profile.last.user_id)
  end
end
