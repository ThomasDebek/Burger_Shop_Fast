class CreateExtras < ActiveRecord::Migration[8.1]
  def change
    create_table :extras do |t|
      t.string :name
      t.decimal :price
      t.references :burger, null: false, foreign_key: true

      t.timestamps
    end
  end
end
