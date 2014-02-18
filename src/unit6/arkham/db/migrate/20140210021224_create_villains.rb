class CreateVillains < ActiveRecord::Migration
  def change
    create_table :villains do |t|
      t.string :name
      t.string :gender
      t.integer :intel
      t.integer :str
      t.integer :speed
      t.integer :durab
      t.integer :power
      t.integer :combat
      t.string :image_url

      t.timestamps
    end
  end
end
