require 'haml'

class Controller
  # attr_reader :name, :action
  attr_reader :action, :name
  attr_accessor :response, :request, :params, :cookie_handler, :status, :headers, :content, :game_model

  def initialize(request, response, action, name)
    @request = request
    @response = response
    @params = request.params
    @action = action
    @name = name
    @game_model = Game.new
    @cookie_handler = CookieHandler.new(@request)
  end

  def call
    send(action)
    response
  end

  def not_found
    Rack::Response.new('Not Found', 404)
  end

  def internal_error
    Rack::Response.new('Internal error', 500)
  end

  def template
    path = File.expand_path("../../app/views/#{self.name}/#{self.action}.haml", __FILE__)
    Haml::Engine.new(File.read(path))
  end
end