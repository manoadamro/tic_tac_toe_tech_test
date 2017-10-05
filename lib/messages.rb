# holds messages printed on win/draw
class Messages
  def initialize(kernel = Kernel)
    @kernel = kernel
  end

  def win(player)
    @kernel.puts "#{player} wins!"
    @kernel.exit
  end

  def draw
    @kernel.puts 'Draw!'
    @kernel.exit
  end
end
