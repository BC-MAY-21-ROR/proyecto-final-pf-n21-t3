require "test_helper"

class SkillTest < ActiveSupport::TestCase
  def setup
    @user = User.create(
      email:"dayala0@hotmail.com", name:"Derek", birthday:"01-01-2001",
      gender:"male", password:"dere2023", password_confirmation:"dere2023"
    )

    @skill = Skill.new(
      name: "Developer", user_id: @user.id
    )
  end

  test 'Skill should be valid' do
    assert @skill.valid?
  end

  test 'Skill should not be valid because is empty' do
    @skill.name = ""
    assert_not @skill.valid?
  end

  test "Skill should not be valid because the user doesn't exits" do
    @skill.user_id = 5
    assert_not @skill.valid?
  end
end
