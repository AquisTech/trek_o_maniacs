class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  def index
    @profiles = Profile.all
  end

  def create
    @profile = current_user.build_profile(profile_params)
    if @profile.save
      redirect_to my_account_users_url, notice: 'Personal Details were successfully saved.'
    else
      render_errors_for(@profile)
    end
  end

  def edit
    render layout: false
  end

  def update
    if @profile.update(profile_params)
      redirect_to after_update_url, notice: 'Personal Details were successfully saved.'
    else
      render_errors_for(@profile)
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

    def after_update_url
      request.referrer.include?('my_account') ? my_account_users_url : profiles_url
    end
end
