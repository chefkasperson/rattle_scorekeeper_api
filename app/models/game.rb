class Game < ApplicationRecord
  has_many :hands
  belongs_to :player_1, class_name: 'Player', foreign_key: "player_1"
  belongs_to :player_2, class_name: 'Player', foreign_key: "player_2"
  belongs_to :player_3, class_name: 'Player', foreign_key: "player_3"
  belongs_to :dealer, class_name: 'Player', foreign_key: "dealer"

  def play_hand(hand)
    updated_score = hand.update_game_score
 
    self.p1_score = updated_score[0]
    self.p2_score = updated_score[1]
    self.p3_score = updated_score[2]
    self.save
  end

  def check_status
    if self.p1_score >= 32 || self.p2_score >= 32 || self.p3_score >= 32
      self.status = 'finished'
      determine_winner
      self.save
    else
      return "no winner yet"
    end
  end

  def determine_winner
    score = [self.p1_score, self.p2_score, self.p3_score]
    over = score.select{|score| score >= 32}
    case over.length
    when 1
      index = score.index{|score| score >= 32}
      determine_winner_from_index(index)
    when 2
      status_array = [self.hands.last.p1_status, self.hands.last.p2_status, self.hands.last.p3_status]
      index = status_array.index{|s| s = 'bid'}
      if score[index] >= 32
        self.determine_winner_from_index(index)
      else
        index = score.index{|score| score >= 32 }
        determine_winner_from_index(index)
      end
    when 3
      status_array = [self.hands.last.p1_status, self.hands.last.p2_status, self.hands.last.p3_status]
      index = status_array.index{|s| s = 'bid'}
      determine_winner_from_index(index)
    end

  end

  def determine_winner_from_index(index)
    if index == 0
      self.winner_id = self.player_1.id
    elsif index == 1
      self.winner_id = self.player_2.id
    elsif index == 2
      self.winner_id = self.player_3.id
    end
  end
end
