class RemoveShippingFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :shipping, :decimal, precision: 12, scale: 3
  end
end
