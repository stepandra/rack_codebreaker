Dir[File.join(File.dirname(__FILE__), 'lib', '*.rb')].each {|file| require file }
Dir[File.join(File.dirname(__FILE__), 'app', '**', '*.rb')].each {|file| require file }

require 'yaml'
require 'yaml/store'
require 'pry-byebug'
require_relative 'app.rb'

class Racker
  def self.call(env)
    App.new.process_and_respond(env).finish
  end
end