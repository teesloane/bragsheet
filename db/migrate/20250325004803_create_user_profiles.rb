class CreateUserProfiles < ActiveRecord::Migration[8.0]
  def change
    create_table :user_profiles do |t|
      t.string :first_name
      t.string :last_name
      t.text :bio
      t.string :location
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
