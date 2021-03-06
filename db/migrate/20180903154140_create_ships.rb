class CreateShips < ActiveRecord::Migration[5.2]
  def change
    create_table :ships do |t|
      t.string :name
      t.decimal :price, precision: 12, scale: 3

      t.timestamps
    end
  end
end
