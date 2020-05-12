class Game < ApplicationRecord
  has_many :hands
  belongs_to :player_1, as: :player
  belongs_to :player_2, as: :player
  belongs_to :player_3, as: :player
  validates :dealer, presence: true


  

end
