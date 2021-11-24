class AddAvatarfullToPlayers < ActiveRecord::Migration[6.1]
  def change
    add_column :players, :avatar_full, :string
  end
end
