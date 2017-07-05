project_root = File.dirname(File.absolute_path(__FILE__))
# require "st_codebreaker"
require "#{project_root}/app/racker"


use Rack::Static,
  urls: ['/css'],
  root: 'public'
run Racker
