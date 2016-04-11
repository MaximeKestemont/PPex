class PagesController < ApplicationController
  def home
  	@users = User.all
  	@videos = Video.all
  end
end