class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :name
      t.string :gender
      t.integer :intell
      t.integer :strength
      t.integer :speed
      t.integer :durab
      t.integer :power
      t.integer :combat
      t.string :image_url

      t.timestamps
    end
  end
end
