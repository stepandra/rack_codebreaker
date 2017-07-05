class CookieHandler
  def initialize(request)
    @request = request
  end

  def game_id
    @request.cookies['game_id']
  end
end