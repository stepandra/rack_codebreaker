require 'st_codebreaker/game'
require 'securerandom'

class GameController < Controller

  attr_accessor :gam

  def index
    game_id = SecureRandom.uuid
    game = StCodebreaker::Game.new
    game_model.save_or_update(game_id, game)
    response.set_cookie('game_id', game_id)
    response.delete_cookie('guess')
    response.delete_cookie('result')
    response.redirect('/game')
  end

  def game
    @game = game_model.find(cookie_handler.game_id)
    p request.cookies
    p cookie_handler.game_id
    response(template())

  end

  def compare
    Rack::Response.new do |response|
      guess = @request.params['guess']
    end
  end
end