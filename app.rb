class App
  ROUTES = YAML.safe_load(File.read(File.join(File.dirname(__FILE__), "app", "routes.yml")))

  def process_and_respond(env)
    request = Rack::Request.new(env)
    Router.new.route(request, ROUTES)
  end
end
