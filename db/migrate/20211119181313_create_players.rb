class CreatePlayers < ActiveRecord::Migration[6.1]
  def change
    create_table :players do |t|
      t.integer :account_id
      t.string :name
      t.string :person_name
      t.integer :mmr

      t.timestamps
    end
  end
end
