class CreateDemos < ActiveRecord::Migration
  def change
    create_table :demos do |t|
      t.integer :age
      t.text :description

      t.timestamps null: false
    end
  end
end
