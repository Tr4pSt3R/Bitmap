require 'matrix'

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
  def row_size; @n; end
  def column_size; @m; end

  def colour(x,y,c)
    offset = -1  #account for origin offset
    @table.[]= y+offset, x+offset, c
  end

  def draw_vertical_segment(x, y1, y2, c)
    [*y1..y2].each{ |y| self.colour(x,y,c) }
  end

  def draw_horizontal_segment(x1, x2, y, c)
    [*x1..x2].each{ |x| self.colour(x,y,c)}
  end

  def fill_region(x,y,c); end

  # Show the contents of the current image
  def show
    self.row_size.times do |row|
      self.column_size.times do |col|
        print "#{self.table.element(row, col)} "
      end
      print "\n"
    end
  end
end

class Matrix
  def []=(i,j,k)
    @rows[i][j] = k
  end
end
