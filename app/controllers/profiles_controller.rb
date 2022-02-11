class ProfilesController < ApplicationController
  def show
    @profile = Profile.find_by(user_id: params[:id])
    @user = User.find_by(id: @profile.user_id)
    @skills = Skill.where(user_id: params[:id])
    @social_network = SocialNetwork.where(user_id: params[:id])
  end

  def index
    @profile = Profile.find_by(user_id: current_user.id)
  end

  def new
    @profile = Profile.new
  end

  def create
    hash = params.require(:profile).permit(:description, :city, :state, :country, :phone_num, :visible)
    hash[:user_id] = current_user.id
    @profile = Profile.new(hash)
    if @profile.save
      redirect_to profile_path(@profile.user_id)
    else
      render 'new'
    end
  end

  def edit
    @profile = Profile.find_by(user_id: params[:id])
  end

  def update
    @profile = Profile.find_by(user_id: current_user.id)
    if @profile.update(params.require(:profile).permit(:description, :city, :state, :country, :phone_num, :visible))
      redirect_to profile_path(@profile.user_id)
    else
      render 'edit'
    end
  end
end
