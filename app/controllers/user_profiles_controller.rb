class UserProfilesController < ApplicationController
	def new
		@user_profile = UserProfile.new
	end

	def create
		 @user_profile = UserProfile.create(user_profile_params)
  		 @user_profile.user_id = current_user.id
  		 #authorize! :create, @user_profile
		 save_profile
	end

	def destroy
	end

 	def edit

	end

	def update

	end
  
  	private

  	def save_profile
		@user_profile.save
		@users = User.all
		render :'pages/home'
  	end

  	def user_profile_params
    	params.require(:user_profile).permit(:name, :user_id, :profile_class)
  	end

end
