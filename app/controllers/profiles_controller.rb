class ProfilesController < ApplicationController
  def show
  end

  def index
    @currentUser = current_user
    @profile = Profile.find_by(id: current_user.id)
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end
end
