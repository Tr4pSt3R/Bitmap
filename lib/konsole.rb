require_relative "bitmap"
require 'pry'

class Konsole
  def initialize
    @matrix = Bitmap.new 0, 0

    # create initial matrix
    i = 0
    loop do
      print "(bitmap) > "
      a = STDIN.gets.chomp

      a = a.split
      cmd, args = a.shift, a

      begin
        send cmd, args
      rescue
        p "Unrecognised input"
      end
      break if (i==5)
    end
  end
end

binding.pry
