# app/controllers/games_controller.rb

class GamesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActionController::ParameterMissing, with: :parameter_missing

  # Action to start a new game
  def create
    @game = Game.create(rolls: [], status: 'in_progress')
    render json: { message: 'New game started' }
  end

  # Action to submit a roll for a game
  def roll
    @game = Game.find(params[:id])
    pins = params.require(:pins).to_i
    return render_error('Invalid number of pins', :bad_request) if pins.negative? || pins > 10

    @game.rolls << pins
    @game.save
    render json: { message: 'Roll submitted' }
  end

  # Action to get the score of a game
  def score
    @game = Game.find(params[:id])
    render json: { score: @game.score }
  end

  private

   # Method to handle ActiveRecord::RecordNotFound error
  def record_not_found
    render_error('Game not found', :not_found)
  end

  # Method to handle ActionController::ParameterMissing error
  def parameter_missing(exception)
    render_error("Parameter missing: #{exception.param}", :bad_request)
  end

  # Method to render error response
  def render_error(message, status)
    render json: { error: message }, status: status
  end
end