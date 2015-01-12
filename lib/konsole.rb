require_relative "bitmap"

class Konsole
  def initialize
    # create initial matrix
    loop do
      print "(bitmap) > "
      a = STDIN.gets.chomp  #gets user input

      a = a.split   #split command from parameters
      cmd, args = a.shift.downcase, a.map( &:to_i )

      begin
        break if i_am_tired_is_the? cmd
        send cmd, args
      rescue
        p "Unrecognised input"
      end
    end
  end

  def i(*args)
    args = args.flatten
    m = args.first
    n = args.last

    @bitmap = Bitmap.new m, n
  end

  def s(*args)
    @bitmap.show
  end

  def c(*args)
    @bitmap.clear
  end

  def l(*args)
    args = args.flatten
    x = args[0]
    y = args[1]
    c = args[2]

    @bitmap.colour x, y, c
  end

  def v(*args)
    args = args.flatten
    x  = args[0]
    y1 = args[1]
    y2 = args[2]
    c  = args[3]
    @bitmap.draw_vertical_segment x, y1, y2, c
  end

  def h(*args)
    args = args.flatten
    x1 = args[0]
    x2 = args[1]
    y  = args[2]
    c  = args[3]
    @bitmap.draw_horizontal_segment x1, x2, y, c
  end

  private
    def i_am_tired_is_the? cmd
      %w[x X exit quit].include? cmd
    end
end

k = Konsole.new
