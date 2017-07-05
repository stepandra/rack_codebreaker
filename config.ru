#\ -s puma
require_relative 'racker'

app = Rack::Builder.new do
  # use Rack::Reloader
  use Rack::Static, urls: ['/stylesheets'], root: 'public'
  use Rack::Session::Cookie,
      key: 'rack.session',
      secret: 'tbf8pBTj',
      expire_after: 432_000
  run Racker
end

run app
