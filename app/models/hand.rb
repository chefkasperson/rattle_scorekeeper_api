class Hand < ApplicationRecord
  belongs_to :game
  has_many :users, through: :game

  validates :bid, presence: true
  validates :bidder_id, presence: true
  validates :p1_score, presence: true
  validates :p2_score, presence: true
  validates :p3_score, presence: true
end
