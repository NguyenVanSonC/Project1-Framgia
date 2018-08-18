class AddSaleToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :sale, :integer, default: 1
  end
end
