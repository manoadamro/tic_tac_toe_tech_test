
#
class Board
  attr_reader :size, :tiles

  def initialize(size = 3)
    @size = size
    @tiles = empty_board(size * size)
  end

  def place(value, x, y)
    index = index_from_coord(x, y)
    can_place = available?(index)
    @tiles[index] = value if can_place
    can_place
  end

  private

  def index_from_coord(x, y)
    (@size * y) + x
  end

  def available?(index)
    @tiles[index].nil?
  end

  def empty_board(sqr_size)
    Array.new(sqr_size) { nil }
  end
end
