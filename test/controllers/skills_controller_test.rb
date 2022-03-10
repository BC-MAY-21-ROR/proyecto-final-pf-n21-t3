require 'test_helper'

class SkillsControllerTest < ActionDispatch::IntegrationTest
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
    @skill = Skill.create(
      name: "Developer", user_id: @user.id
    )
  end

  test "Should get new" do
    get new_skill_url
    assert_response :success
  end

  test "Should create a skill" do
    assert_difference "Skill.count", 1 do
      post skills_url, params: {
        skill: {
          name: "Accountant"
        }
      }
    end
    assert_redirected_to profile_url(@profile.user_id)
  end

  test "Should delete a skill" do
    assert_difference "Skill.count", -1 do
      delete skill_url(@skill)
    end
  end
end
