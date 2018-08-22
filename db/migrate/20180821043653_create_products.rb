class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :cost
      t.boolean :status
      t.string :image

      t.timestamps
    end
  end
end
