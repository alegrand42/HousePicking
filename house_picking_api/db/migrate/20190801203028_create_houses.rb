class CreateHouses < ActiveRecord::Migration[5.1]
  def change
    create_table :houses do |t|
      t.string :name
      t.integer :room
      t.string :size
      t.string :agency
      t.string :url
      t.string :disponibility

      t.timestamps
    end
  end
end
