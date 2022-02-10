class SocialNetworksController < ApplicationController
  def new
    @social_network = SocialNetwork.new
  end

  def create
    hash = params.require(:social_network).permit(:twitter, :Facebook, :LinkendIn, :Instagram)
    hash[:user_id] = current_user.id
    @social_network = SocialNetwork.new(hash)
    if @social_network.save
      redirect_to profile_path(@social_network.user_id)
    else
      render 'new'
    end
  end

  def edit
    @social_network = SocialNetwork.find_by(user_id: params[:id])
  end

  def update
    @social_network = SocialNetwork.find_by(user_id: current_user.id)
    if @social_network.update(params.require(:social_network).permit(:twitter, :Facebook, :LinkendIn, :Instagram))
      redirect_to profile_path(@social_network.user_id)
    else
      render 'edit'
    end
  end
end
