class RenameClassColumn < ActiveRecord::Migration
  def change
	rename_column :user_profiles, :class, :profile_class
  end
end
