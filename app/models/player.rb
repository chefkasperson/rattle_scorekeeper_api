class Player < ApplicationRecord
  has_many :games
  has_many :hands, through: :games
end
