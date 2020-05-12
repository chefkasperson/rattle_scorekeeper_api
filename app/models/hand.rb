class Hand < ApplicationRecord
  belongs_to :game
  has_many :players, through: :game

  validates :bid, presence: true
  validates :p1_score, presence: true
  validates :p2_score, presence: true
  validates :p3_score, presence: true
  validates :trump, presence: true
  validates :p1_status, presence: true
  validates :p2_status, presence: true
  validates :p3_status, presence: true

  BIDS = ['2', '3', '4', '5', '6', '7', '8', 'Moon']
  TRUMP = ['hearts', 'spades', 'diamonds', 'clubs', 'no-trump']
  SCORES = [0, 1, 2, 3, 4, 5, 6, 7, 8]
  STATUS = ['pass', 'stay', 'bid']
  

  def update_game_score
    p1 = update_p1_score
    p2 = update_p2_score
    p3 = update_p3_score
    
    total = [p1, p2, p3]
    total

  end

  def valid_status?
    if trump == 'no-trump'
      if p1_status == 'pass' || p2_status == 'pass' || p3_status == 'pass'
        false
      end
    end
    true
  end

  def valid_score?
    self.p1_score.to_i + self.p2_score.to_i + self.p3_score.to_i == 8 ? true : false
  end
  
  def update_p1_score
    case p1_status
    when 'pass'
      self.game.p1_score + 0
    when 'stay'
      if p1_score == '0'
        self.game.p1_score - 8
      else
        self.game.p1_score + p1_score.to_i
      end
    when 'bid'
      if bid == 'moon'
        if p1_score == '8'
          self.game.p1_score + 16
        else
          self.game.p1_score - 16
        end
      elsif p1_score.to_i >= bid.to_i
        self.game.p1_score + p1_score.to_i
      else
        self.game.p1_score - p1_score.to_i
      end
    end  
  end

  def update_p2_score
    case p2_status
    when 'pass'
      self.game.p2_score + 0
    when 'stay'
      if p2_score.to_i == 0
        self.game.p2_score - 8
      else
        self.game.p2_score + p2_score.to_i
      end
    when 'bid'
      if bid == 'moon'
        if p2_score.to_i == 8
          self.game.p2_score + 16
        else
          self.game.p2_score - 16
        end
      elsif p2_score.to_i >= bid.to_i
        self.game.p2_score + p2_score.to_i
      else
        self.game.p2_score - p2_score.to_i
      end
    end  
  end
  
  def update_p3_score
    case p3_status
    when 'pass'
      self.game.p3_score + 0
    when 'stay'
      if p3_score.to_i == 0
        self.game.p3_score - 8
      else
        self.game.p3_score + p3_score.to_i
      end
    when 'bid'
      if bid == 'moon'
        if p3_score.to_i == 8
          self.game.p3_score + 16
        else
          self.game.p3_score - 16
        end
      elsif p3_score.to_i >= bid.to_i
        self.game.p3_score + p3_score.to_i
      else
        self.game.p3_score - p3_score.to_i
      end
    end  
  end





 
end
