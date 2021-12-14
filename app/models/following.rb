class Following < ApplicationRecord
  belongs_to :user
  belongs_to :player
  validates :user_id, uniqueness: {scope: :player_id}
end
