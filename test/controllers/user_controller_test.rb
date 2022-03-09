require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create(
      email:"dayala0@hotmail.com", name:"Derek", birthday:"01-01-2001",
      gender:"male", password:"dere2023", password_confirmation:"dere2023"
    )
  end

  test "Should get new" do
    get new_user_registration_url
    assert_response :success
  end

  test "Should create User" do
    assert_difference "User.count", 1 do
      post user_registration_url, params: { user: { email:"dayala0@ucol.mx", name:"Derek", birthday:"01-01-2001",
        gender:"male", password:"dere2023", password_confirmation:"dere2023" } }
    end
    assert_redirected_to root_url
  end

  test "Should get edit" do
    post new_user_session_url, params: { user: { email:"dayala0@hotmail.com", password:"dere2023" } }
    get edit_user_registration_url(@user)
    assert_response :success
  end

  test "Should log out" do
    post new_user_session_url, params: { user: { email:"dayala0@hotmail.com", password:"dere2023" } }
    delete destroy_user_session_url(@user)
    assert_response :success
  end
end
