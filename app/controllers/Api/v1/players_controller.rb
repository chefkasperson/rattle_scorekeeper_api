class Api::V1::PlayersController < ApplicationController

  def index
    players = Player.all
    render json: {
      players: players.as_json(except: [:created_at, :updated_at])
    }
  end

  def create

  end


end
