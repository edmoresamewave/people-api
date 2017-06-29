class CreateGoals < ActiveRecord::Migration[5.1]
  def change
    create_table :goals do |t|
      t.string :title
      t.integer :score
      t.references :person, foreign_key: true

      t.timestamps
    end
  end
end
