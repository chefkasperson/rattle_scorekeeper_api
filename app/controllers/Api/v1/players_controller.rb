class Api::V1::PlayersController < ApplicationController

  def index
    players = Player.all
    render json: {
      players: players.as_json(except: [:created_at, :updated_at])
    }
  end

  def create
    player = Player.new(player_params)
    if player.save
      render json: player.as_json(except: [:created_at, :updated_at])
    else
      render json: {error: player.errors.full_messages}
    end
    
  end

  private

  def player_params
    params.require(:player).permit(:name)
  end

end
