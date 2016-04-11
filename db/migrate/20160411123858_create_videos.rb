class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.integer :experience
      t.string :className
      t.integer :level_required
      t.string :class_required

      t.timestamps null: false
    end
  end
end
