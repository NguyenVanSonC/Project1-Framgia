class AddTypeToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :type, :integer, default: 1
  end
end
