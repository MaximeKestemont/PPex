class AddColumnProfileClass < ActiveRecord::Migration
  def change
	add_column :profile_classes, :level, :integer, :default => 0
  end
end
