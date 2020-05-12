class Hand < ApplicationRecord
  belongs_to :game
  has_many :players, through: :game

  validates :bid, presence: true
  validates :p1_score, presence: true
  validates :p2_score, presence: true
  validates :p3_score, presence: true
  validates :bidder_id, presence: true

  BIDS = ['2', '3', '4', '5', '6', '7', '8', 'Moon']
  TRUMP = ['hearts', 'spades', 'diamonds', 'clubs', 'no-trump']
  SCORES = ['pass',]

 
end
