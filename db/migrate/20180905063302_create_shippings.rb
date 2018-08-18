class CreateShippings < ActiveRecord::Migration[5.2]
  def change
    create_table :shippings do |t|
      t.references :order, foreign_key: true
      t.references :shipper, foreign_key: true

      t.timestamps
    end
  end
end
