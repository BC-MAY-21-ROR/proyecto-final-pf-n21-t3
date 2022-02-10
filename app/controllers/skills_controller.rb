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

  def destroy
    @skill = Skill.find(params[:id])
    link = @skill.user_id
    @skill.destroy
    redirect_to profile_path(link)
  end
end
