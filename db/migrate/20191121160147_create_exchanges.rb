class CreateExchanges < ActiveRecord::Migration[6.0]
  def change
    create_table :exchanges do |t|
      t.datetime :time
      t.string :location
      t.integer :exchanger_id
      t.integer :exchangee_id
      t.string :description
      t.timestamps
    end
  end
end
