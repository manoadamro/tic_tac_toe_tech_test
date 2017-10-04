
#
class Board
  def initialize(size = 3, tiles = Tiles)
    @tiles = tiles.new(size)
  end

  def place(value, x, y)
    can_place = available?(x, y)
    @tiles[x, y] = value if can_place
    can_place
  end

  def tile(x, y)
    @tiles[x, y]
  end

  def sqr_size
    @tiles.length
  end

  private

  def available?(x, y)
    @tiles[x, y] == ''
  end
end
