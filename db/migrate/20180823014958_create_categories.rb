class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :description
      t.string :img_url
      t.integer :child_of

      t.timestamps
    end
  end
end
