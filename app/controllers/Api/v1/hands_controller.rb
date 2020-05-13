class Api::V1::HandsController < ApplicationController

  def index
    players = Players.all
    render json: {
      players: players.as_json(except: [:created_at, :updated_at])
    }
  end

  def create

  end

  def update

  end
end
