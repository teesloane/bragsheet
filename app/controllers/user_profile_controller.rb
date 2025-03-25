class UserProfileController < ApplicationController
  def edit
    @user_profile = Current.user.user_profile || Current.user.build_user_profile
  end

  def update
    @user_profile = Current.user.user_profile || Current.user.build_user_profile

    if @user_profile.update(user_profile_params)
      redirect_to edit_user_profile_path, notice: 'Profile updated successfully.'
    else
      render :edit
    end
  end

  private

  def user_profile_params
    params.require(:user_profile).permit(:first_name, :last_name, :bio, :location)
  end
end
