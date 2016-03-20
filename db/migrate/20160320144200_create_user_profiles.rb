class CreateUserProfiles < ActiveRecord::Migration
  def change
    create_table :user_profiles do |t|
      t.integer :user_id
      t.integer :experience
      t.string :class

      t.timestamps null: false
    end
  end
end
