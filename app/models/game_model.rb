class Game
  DB_PATH = 'db.yml'

  attr_accessor :data

  def initialize
    @data = (File.exist?(DB_PATH) ? YAML::Store.new(DB_PATH) : create_store)
  end

  def save_or_update(id, game)
    @data.transaction { @data[:games][id] = game }
  end

  def find(id)
    @data.transaction { @data[:games][id] }
  end

  private

  def create_store
    games_store = YAML::Store.new(DB_PATH)
    games_store.transaction { games_store[:games] = {} }
  end
end