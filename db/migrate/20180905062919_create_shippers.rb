class CreateShippers < ActiveRecord::Migration[5.2]
  def change
    create_table :shippers do |t|
      t.string :company
      t.string :motobike_number
      t.string :motobike_color
      t.string :id_number
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
