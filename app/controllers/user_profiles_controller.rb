class UserProfilesController < ApplicationController
	def new
		@user_profile = UserProfile.new
	end

	def create
		 #@user_profile = UserProfile.create(user_profile_params)
  		 #@user_profile.user_id = current_user.id
  		 #authorize! :create, @user_profile
		 #@user_profile.save!
		 logger.debug "TEST"
		 user_profile = current_user.create_user_profile(user_profile_params)
		 class1 = user_profile.profile_class.new
		 class1.className = "Warrior"
		 class1.experience = 0
		 class1.save

		 class2 = user_profile.profile_class.new
		 class2.className = "Archer"
		 class2.experience = 0
		 class2.save

 		 redirect_to root_path
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

	# Add experience to a specific class
	def add_experience_to_class
		@profile_class = ProfileClass.find(params[:id])
		if @profile_class.experience == 99
			@profile_class.experience = 0
			@profile_class.level = @profile_class.level + 1
 		elsif @profile_class.experience
 			@profile_class.experience = @profile_class.experience + 1
 		else 
 			@profile_class.experience = 0
 		end
 		@profile_class.save!
 		render :update_experience_bar
	end

	# Find the class based on the className, then add experience to it
	def find_then_add_experience_to_class
		user_profile = UserProfile.find(params[:id])

		# TODO pattern matching to find the class with the correct name
		#logger.debug user_profile.profile_class

		@profile_class = ProfileClass.find_by className: params[:className], user_profile_id: user_profile.id

		# add_experience_to_class(profile_class.id)	TODO DOES NOT WORK, WHY???

		# get experience and convert it to integer
		experience_gain = params[:experience_gain].to_i

		if @profile_class.experience >= 100-experience_gain
			@profile_class.experience = @profile_class.experience + experience_gain - 100
			@profile_class.level = @profile_class.level + 1
 		elsif @profile_class.experience
 			@profile_class.experience = @profile_class.experience + experience_gain
 		else 
 			@profile_class.experience = 0
 		end
 		@profile_class.save!
 		render :update_experience_bar
	end

	def update

	end
  
  	private

  	def user_profile_params
    	params.require(:user_profile).permit(:name, :user_id)
  	end

end
