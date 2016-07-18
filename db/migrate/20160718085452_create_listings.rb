class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :location
      t.integer :bedroom
      t.integer :bathroom
      t.integer :max_people
      t.string :facilities
      t.integer :price

      t.timestamps null: false
    end
  end
end
