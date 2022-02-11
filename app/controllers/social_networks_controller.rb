class SocialNetworksController < ApplicationController
  def new
    @social_network = SocialNetwork.new
  end

  def create
    hash = social_network_params
    hash[:user_id] = current_user.id
    @validate = SocialNetwork.find_by(hash.slice(:network, :user_id))
    if @validate.nil?
      @social_network = SocialNetwork.new(hash)
      if @social_network.save
        redirect_to profile_path(@social_network.user_id)
      else
        render 'new'
      end
    else
      if @validate.update(hash)
        redirect_to profile_path(hash[:user_id])
      else
        render 'new'
      end
    end
  end

  def destroy
    @social_network = SocialNetwork.find(params[:id])
    link = @social_network.user_id
    @social_network.delete
    redirect_to profile_path(link)
  end

  private

  def social_network_params
    params.require(:social_network).permit(:url, :network)
  end
end
