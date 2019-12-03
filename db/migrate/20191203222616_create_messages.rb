class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.user_id :integer
      t.exchange_id :integer
      t.content :string

      t.timestamps
    end
  end
end
