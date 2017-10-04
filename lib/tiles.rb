
# Hold an array of game tiles, can index and set specific tiles
class Tiles
  def initialize(size, array_klass = Array)
    @size = size
    @tiles = array_klass.new(size * size) { '' }
  end

  def [](x, y)
    index = index_from_coord(x, y)
    @tiles[index] if index < @tiles.length
    nil
  end

  def []=(x, y, value)
    index = index_from_coord(x, y)
    @tiles[index] = value
  end

  def length
    @tiles.length
  end

  private

  def index_from_coord(x, y)
    (@size * y) + x
  end
end
