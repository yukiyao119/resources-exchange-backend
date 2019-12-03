class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :exchange_id
      t.string :content
      t.string :author
      t.timestamps
    end
  end
end
