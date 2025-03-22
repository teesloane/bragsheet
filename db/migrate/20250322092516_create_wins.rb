class CreateWins < ActiveRecord::Migration[8.0]
  def change
    create_table :wins do |t|
      t.string :title
      t.text :description
      t.text :impact
      t.date :achievement_date
      t.text :private_notes
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
