class ChangePlayerIdToAccountId < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :player_id, :integer
    add_column :users, :account_id, :integer
  end
end
