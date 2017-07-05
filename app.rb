class App
  ROUTES = YAML.load(File.read(File.join(File.dirname(__FILE__), "app", "routes.yml")))

  def process_and_respond(env)
    request = Rack::Request.new(env)
    response = Rack::Response.new

    response = Router.new.route(request, response, ROUTES)
    response
  end
end