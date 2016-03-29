class CreateProfileClasses < ActiveRecord::Migration
  def change
    create_table :profile_classes do |t|
      t.string :className
      t.integer :experience
      t.integer :user_profile_id

      t.timestamps null: false
    end
  end
end
