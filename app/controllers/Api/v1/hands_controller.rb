class Api::V1::HandsController < ApplicationController

  def index
   hands = Hand.all 
   render json: {hands: hands.as_json(except: [:created_at, :updated_at])}
  end

  def create

  end

  def update

  end
end
