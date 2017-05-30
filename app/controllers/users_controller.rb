class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def edit
    render layout: false
  end

  def update
    if @user.update(user_params)
      redirect_to users_url, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  def show
    render layout: false
  end

  def destroy
    @user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  def my_account
    @profile = current_user.profile || current_user.build_profile
  end

  def update_username
    if current_user.update(user_params)
      redirect_to my_account_users_url, notice: 'Username was successfully saved.'
    else
      render_errors_for(current_user)
    end
  end

  def update_password
    current_user.validate_current_password = true
    if current_user.update(user_params)
      redirect_to my_account_users_url, notice: 'Password was successfully saved.'
    else
      render_errors_for(current_user)
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      attributes = case action_name
      when 'update'
        [
          :email, :encrypted_password, :reset_password_token, :reset_password_sent_at,
          :remember_created_at, :sign_in_count, :current_sign_in_at, :last_sign_in_at,
          :current_sign_in_ip, :last_sign_in_ip, :confirmation_token, :confirmed_at,
          :confirmation_sent_at, :unconfirmed_email, :failed_attempts, :unlock_token, :locked_at
        ]
      when 'update_username'
        [:username]
      when 'update_password'
        [:current_password, :password, :password_confimation]
      end
      params.require(:user).permit(*attributes)
    end
end
