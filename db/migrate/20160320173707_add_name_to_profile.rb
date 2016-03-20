class AddNameToProfile < ActiveRecord::Migration
  def change
	add_column :user_profiles, :name, :string
  end
end
