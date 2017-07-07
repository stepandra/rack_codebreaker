require 'st_codebreaker/game'
require 'securerandom'

class GameController < Controller
  attr_reader :game_model, :request, :cookie_handler

  def initialize(request, action, name)
    @request = request
    @game_store = GameStore.new
    @cookie_handler = CookieHandler.new(@request) unless @request.nil?
    super(action, name)
  end

  def index
    Rack::Response.new do |response|
      game_id = SecureRandom.uuid
      game = StCodebreaker::Game.new
      game_store.save_or_update(game_id, game)
      response.set_cookie('game_id', game_id)
      response.delete_cookie('guess')
      response.delete_cookie('result')
      response.redirect('/game')
    end
  end

  def game
    @game = game_store.find(cookie_handler.game_id)
    p request.cookies
    p cookie_handler.game_id
    Rack::Response.new([template], 200)
  end

  def compare
    Rack::Response.new do |response|
      guess = @request.params['guess']
    end
  end
end
