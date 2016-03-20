class UserProfilesController < ApplicationController
	def new
		@user_profile = UserProfile.new
	end

	def create
		 @user_profile = UserProfile.create(user_profile_params)
  		 @user_profile.user_id = current_user.id
  		 #authorize! :create, @user_profile
		 save_profile
		 render :'pages/home'
	end

	def destroy
	end

 	def edit
 		@user_profile = UserProfile.find(params[:id])
 		if ( @user_profile.experience )
 			@user_profile.experience = @user_profile.experience + 1
 		else 
 			@user_profile.experience = 0
 		end
 		save_profile
 		render :'pages/home'
	end

	def update

	end
  
  	private

  	def save_profile
		@user_profile.save
		@users = User.all
  	end

  	def user_profile_params
    	params.require(:user_profile).permit(:name, :user_id, :profile_class)
  	end

end
