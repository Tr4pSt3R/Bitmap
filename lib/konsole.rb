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
      cmd, args = a.shift, a.map(&:to_i)

      break if (%w[x, X].include? cmd)
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
end

binding.pry
