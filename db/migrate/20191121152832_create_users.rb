class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :displayname
      t.integer :donated_hour
      t.string :time_slot
      t.string :location
      t.string :img
      t.string :bio
      t.float :lat
      t.float :lng
      t.timestamps
    end
  end
end
