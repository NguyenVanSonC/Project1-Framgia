class RemoveTypeFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :type, :integer
  end
end
