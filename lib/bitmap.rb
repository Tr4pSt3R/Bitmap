require 'pry'
require 'matrix'

VALID_CMDS = ["init", "I", "C", "L", "V", "H", "F", "S", "X"]

def is_valid_command?( arg )
  VALID_CMDS.include? arg
end

class Bitmap
  WHITE = 0

  def initialize(m, n)
    @m = m #column
    @n = n #row
    @table = Matrix.zero(@n, @m)
  end

  def clear
    @table = Matrix.zero( @n, @m )
  end

  def table; @table; end

  def colour(x,y,c)
    offset = -1  #account for origin offset
    self.table.[]= y+offset, x+offset, c
  end

  def draw_vertical_segment(x, y1, y2, c)
    [*y1..y2].each{ |y| self.colour(x,y,c) }
  end

  def draw_horizontal_segment(x1, x2, y, c)
    [*x1..x2].each{ |x| self.colour(x,y,c)}
  end

  def fill_region(x,y,c); end

  private
    # def fill
end

class Matrix
  def []=(i,j,k)
    @rows[i][j] = k
  end
end

# binding.pry
