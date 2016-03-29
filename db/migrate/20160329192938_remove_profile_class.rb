class RemoveProfileClass < ActiveRecord::Migration
  def change
    remove_column :user_profiles, :profile_class
  end

end
