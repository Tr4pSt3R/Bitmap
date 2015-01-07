require 'pry'
require 'matrix'

VALID_CMDS = ["init", "I", "C", "L", "V", "H", "F", "S", "X"]

def is_valid_command?( arg )
  VALID_CMDS.include? arg
end

class Bitmap
  WHITE = 0

  def initialize(m, n)
    @m = m
    @n = n
    @table = I [m, n]
  end

  def I(args)
    col, row = args.first, args.last
    @table = Matrix.build(col,row){ WHITE }
  end

  def clear; end

  def table
    @table
  end
end
