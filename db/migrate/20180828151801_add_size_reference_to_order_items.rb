class AddSizeReferenceToOrderItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :order_items, :size, foreign_key: true
  end
end
