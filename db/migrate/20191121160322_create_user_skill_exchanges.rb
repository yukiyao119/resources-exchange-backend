class CreateUserSkillExchanges < ActiveRecord::Migration[6.0]
  def change
    create_table :user_skill_exchanges do |t|
      t.integer :user_skill_id
      t.integer :exchange_id

      t.timestamps
    end
  end
end
