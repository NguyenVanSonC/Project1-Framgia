class CreateRates < ActiveRecord::Migration[5.2]

  def self.up
      create_table :rates do |t|
        t.belongs_to :rater
        t.belongs_to :rateable, :polymorphic => true
        t.float :stars, :null => false
        t.string :dimension
        t.timestamps
      end

<<<<<<< 93600a0a0ca623c723ad4ba4eac215af7701c999
=======
      add_index :rates, :rater_id
>>>>>>> order
      add_index :rates, [:rateable_id, :rateable_type]
    end

    def self.down
      drop_table :rates
    end

end
