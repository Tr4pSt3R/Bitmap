require_relative "lib/bitmap"

class Konsole
  def initialize
    @matrix = Bitmap.new 0, 0

    # create initial matrix
    i = 0
    loop do
      print "(bitmap) > "
      a = STDIN.gets.chomp
      break if (i==5)
    end
  end
end
