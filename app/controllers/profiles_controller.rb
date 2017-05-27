class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  def index
    @profiles = Profile.all
  end

  def new
    @profile = Profile.new
    render layout: false
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      redirect_to profiles_url, notice: 'Profile was successfully created.'
    else
      render :new
    end
  end

  def edit
    render layout: false
  end

  def update
    if @profile.update(profile_params)
      redirect_to profiles_url, notice: 'Profile was successfully updated.'
    else
      render :edit
    end
  end

  def show
    render layout: false
  end

  def destroy
    @profile.destroy
    redirect_to profiles_url, notice: 'Profile was successfully destroyed.'
  end

  private
    def set_profile
      @profile = Profile.find(params[:id])
    end

    def profile_params
      params.require(:profile).permit(:user_id, :first_name, :last_name, :membership_started_on, :social_links)
    end
end
