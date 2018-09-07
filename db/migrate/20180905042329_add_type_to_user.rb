class AddTypeToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :typeUser, :integer, default: 2
  end
end
