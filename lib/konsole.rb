require_relative "bitmap"
require 'pry'

class Konsole
  def initialize
    # create initial matrix
    i = 0
    loop do
      print "(bitmap) > "
      a = STDIN.gets.chomp

      a = a.split
      cmd, args = a.shift, a.map( &:to_i )

      break if ( %w[x, X, exit].include? cmd )
      send cmd, args

      # begin
      #   break if (%w[x, X].include? cmd)
      #   send cmd, args
      # rescue
      #   p "Unrecognised input"
      # end
    end
  end

  def I(*args)
    args = args.flatten
    m = args.first
    n = args.last

    @bitmap = Bitmap.new m, n
  end

  def S(*args)
    @bitmap.show
  end

  def C(*args)
    @bitmap.clear
  end

  def L(*args)
    args = args.flatten
    x = args[0]
    y = args[1]
    c = args[2]

    @bitmap.colour x, y, c
  end

  def V(*args)
    args = args.flatten
    x  = args[0]
    y1 = args[1]
    y2 = args[2]
    c  = args[3]
    @bitmap.draw_vertical_segment x, y1, y2, c
  end

  def H(*args)
    args = args.flatten
    x1 = args[0]
    x2 = args[1]
    y  = args[2]
    c  = args[3]
    @bitmap.draw_horizontal_segment x1, x2, y, c
  end
end

binding.pry
