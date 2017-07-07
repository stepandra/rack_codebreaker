require 'haml'

class Controller
  attr_reader :action, :name

  def initialize(action = nil, name = nil)
    @action = action
    @name = name
  end

  def call
    send(action)
  end

  def not_found
    Rack::Response.new('Not Found', 404)
  end

  def internal_error
    Rack::Response.new('Internal error', 500)
  end

  def template
    path = File.expand_path("../../app/views/#{self.name}/#{self.action}.haml", __FILE__)
    Haml::Engine.new(File.read(path)).render(binding)
  end
end
