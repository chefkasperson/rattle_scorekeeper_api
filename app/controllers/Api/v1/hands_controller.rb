class Api::V1::HandsController < ApplicationController

  def index
   hands = Hand.all 
   render json: {hands: hands.as_json(except: [:created_at, :updated_at])}
  end

  def create
    game = Game.find_by(id: hand_params[:game_id])
    hand = game.hands.build
    if hand_params[:player1] == 'pass'
      hand.p1_score = "0"
      hand.p1_status = "pass"
    else
      hand.p1_score = hand_params[:player1]
      hand.p1_status = 'stay'
    end
    if hand_params[:player2] == 'pass'
      hand.p2_score = "0"
      hand.p2_status = "pass"
    else
      hand.p2_score = hand_params[:player2]
      hand.p2_status = 'stay'
    end
    if hand_params[:player3] == 'pass'
      hand.p3_score = "0"
      hand.p3_status = "pass"
    else
      hand.p3_score = hand_params[:player3]
      hand.p3_status = 'stay'
    end
    if hand_params[:bidder] == '1'
      hand.bidder_id = game.player_1.id
      hand.p1_status = 'bid'
    elsif hand_params[:bidder] == '2'
      hand.bidder_id = game.player_2.id
      hand.p2_status = 'bid'
    else
      hand.bidder_id = game.player_3.id
      hand.p3_status = 'bid'
    end 
    hand.bid = hand_params[:bid]
    hand.trump = hand_params[:trump]
    binding.pry

    if hand.valid? && hand.valid_status? && hand.valid_score?
      hand.save
      game.play
      render json: hand
    else
      render json: { error: hand.errors, status: :unprocessable_entity}
    end
  end

  def update

  end

  private

  def hand_params
    params.require(:hand).permit(:player1, :player2, :player3, :bidder, :bid, :trump, :game_id)
  end
end
