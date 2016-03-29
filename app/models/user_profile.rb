class UserProfile < ActiveRecord::Base
	belongs_to :user
	validates_presence_of :user
	has_many :profile_class
end
