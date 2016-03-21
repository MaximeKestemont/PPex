class UserProfilesController < ApplicationController
	def new
		@user_profile = UserProfile.new
	end

	def create
		 #@user_profile = UserProfile.create(user_profile_params)
  		 #@user_profile.user_id = current_user.id
  		 #authorize! :create, @user_profile
		 #@user_profile.save!
		 current_user.create_user_profile(user_profile_params)
 		 redirect_to home_path
	end

	def destroy
	end

 	def edit
 		
	end

	def add_experience
		user_profile = UserProfile.find(params[:id])
 		if user_profile.experience
 			user_profile.experience = user_profile.experience + 1
 		else 
 			user_profile.experience = 0
 		end
 		user_profile.save!
 		redirect_to :back
	end

	def update

	end
  
  	private

  	def user_profile_params
    	params.require(:user_profile).permit(:name, :user_id, :profile_class)
  	end

end
