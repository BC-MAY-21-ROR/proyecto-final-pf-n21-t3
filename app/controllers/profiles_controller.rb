class ProfilesController < ApplicationController
  def show
    @profile = Profile.find_by(user_id: params[:id])
    @user = User.find_by(id: @profile.user_id)
    @skills = Skill.where(user_id: params[:id])
    @social_network = SocialNetwork.where(user_id: params[:id])
  end

  def index
    name = params[:name]
    option = params[:option]
    @profile = Profile.find_by(user_id: current_user.id)
    if name.blank?
      @profiles = Profile.where.not(user_id: current_user.id).where(visible: true)
    else
      id = find(name, option)
      @profiles = Profile.where.not(user_id: current_user.id).where(user_id: id)
    end
    render 'index'
  end

  def find(name, option)
    if option == 'name'
      names = User.where("name LIKE :prefix", prefix: "%#{name}%")
      id = names.map(&:id)
    else
      skills = Skill.where("name LIKE :prefix", prefix: "%#{name}%")
      id = skills.map(&:user_id)
    end
    id
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
