class Player < ApplicationRecord
  has_many :games
  has_many :hands, through: :games
  validates :name, presence: true, uniqueness: true
end
