class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.integer :user_id
      t.string :name
      t.string :address
      t.string :city
      t.string :country
      t.string :property
      t.integer :bedroom
      t.integer :bathroom
      t.integer :max_people
      t.string :facilities
      t.integer :price
      t.timestamps null: false
    end
  end
end
