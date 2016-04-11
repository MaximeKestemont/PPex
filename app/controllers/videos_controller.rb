class VideosController < ApplicationController
	def new
  		@video = Video.new
  		render :add_video_form
	end

	def create
  		@video = Video.create(video_params)
		save_video
	end

	def destroy
  		@video = Video.find(params[:id])
  		@video.destroy
  		@videos = Video.all

    	render :destroy_video
	end

 	def edit

	end

	def update

	end
  
  	private

  	def save_video
    	if @video.save
      		@videos = Video.all
      		render :hide_video_form
    	else
      		render :add_video_form
    	end
  	end

  	def video_params
    	params.require(:video).permit(:title, :experience, :className, :level_required, :class_required)
  	end
end
