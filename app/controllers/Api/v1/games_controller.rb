class Api::V1::GamesController < ApplicationController

  def index
    games = Game.all 
    render json: {
      games: games.as_json(except: [:created_at, :updated_at])
    }
  end

  def create
    binding.pry
  end

end
