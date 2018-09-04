class AddCategoriesToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :Category, foreign_key: true
  end
end
