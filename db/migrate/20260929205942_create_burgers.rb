class CreateBurgers < ActiveRecord::Migration[8.1]
  def change
    create_table :burgers do |t|
      t.string :name
      t.decimal :price
      t.integer :stock
      t.string :size

      t.timestamps
    end
  end
end
