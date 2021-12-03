class AddTeamToPlayers < ActiveRecord::Migration[6.1]
  def change
    add_column :players, :team, :string
  end
end
