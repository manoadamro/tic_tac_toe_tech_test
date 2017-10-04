#
class Patterns
  def self.column(i)
    [[i, 0], [i, 1], [i, 2]]
  end

  def self.row(i)
    [[0, i], [1, i], [2, i]]
  end

  def self.diagonal
    [[0, 0], [1, 1], [2, 2]]
  end

  def self.anti_diagonal
    [[0, 2], [1, 1], [2, 0]]
  end
end
