class Player < ApplicationRecord
  validates :account_id, :name, :person_name, presence: true
  validates :account_id, :name, uniqueness: true
  has_many :followings
  has_many :users, through: :followings
end
