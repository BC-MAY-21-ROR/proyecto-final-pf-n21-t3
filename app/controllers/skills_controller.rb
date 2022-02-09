class SkillsController < ApplicationController
  def new
    @skill = Skill.new
  end

  def create
    hash = params.require(:skill).permit(:name)
    hash[:user_id] = current_user.id
    @skill = Skill.new(hash)
    if @skill.save
      redirect_to profile_path(@skill.user_id)
    else
      render 'new'
    end
  end
end
