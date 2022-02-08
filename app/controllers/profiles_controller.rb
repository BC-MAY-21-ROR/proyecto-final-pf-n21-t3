class ProfilesController < ApplicationController
  def show
    @profile = Profile.find_by(user_id: params[:id])
    @user = User.find_by(id: @profile.user_id)
  end

  def index
    @currentUser = current_user
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
      redirect_to profiles_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
