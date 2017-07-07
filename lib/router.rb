class Router
  def route(request, routes)
    path = request.path
    routes.key?(path) ? ctrl(routes[path], request).call : Controller.new.not_found
  rescue Exception => err
    puts err.message
    puts err.backtrace
    Controller.new.internal_error
  end

  private

  def ctrl(string, request)
    ctrl_name, action_name = string.split('#')
    klass = Object.const_get("#{ctrl_name.capitalize}Controller", Class.new)
    klass.new(request, action_name, ctrl_name)
  end
end
