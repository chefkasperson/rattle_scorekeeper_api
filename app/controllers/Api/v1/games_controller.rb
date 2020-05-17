class Api::V1::GamesController < ApplicationController

  def index
    games = Game.all 
    render json: {
      games: games.as_json(except: [:created_at, :updated_at], include: [:hands])
    }
  end

  def create
    p1 = Player.find_by(name: game_params[:player_1])
    p2 = Player.find_by(name: game_params[:player_2])
    p3 = Player.find_by(name: game_params[:player_3])
    dp = game_params[:dealer]
    if dp == '1'
      dealer = p1
    elsif dp == '2'
      dealer = p2
    else
      dealer = p3
    end
    game = Game.new(player_1: p1, player_2: p2, player_3: p3, dealer: dealer)

    if game.save
      render json: game.as_json(include: [:hands]), status: :created
    else
      render json: {error: game.errors.full_messages, status: :unprocessable_entity}
    end
  end

  private

  def game_params
    params.require('game').permit(:player_1, :player_2, :player_3, :dealer)
  end 
end
