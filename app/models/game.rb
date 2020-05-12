class Game < ApplicationRecord
  has_many :hands
  belongs_to :player_1, class_name: 'Player', foreign_key: "player_1"
  belongs_to :player_2, class_name: 'Player', foreign_key: "player_2"
  belongs_to :player_3, class_name: 'Player', foreign_key: "player_3"
  belongs_to :dealer, class_name: 'Player', foreign_key: "dealer"

  def play_hand(hand)
    score = hand.update_game_score
 
    self.p1_score = score[0]
    self.p2_score = score[1]
    self.p3_score = score[2]
    self
  end

end
