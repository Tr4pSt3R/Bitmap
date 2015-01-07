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
    self.table.[]= x+offset, y+offset, c
  end
end

class Matrix
  def []=(i,j,k)
    @rows[i][j] = k
  end
end

binding.pry
