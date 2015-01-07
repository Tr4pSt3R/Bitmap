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
  end

  def I(args)
    col, row = args.first, args.last
    @matrix = Matrix.build(col,row){ WHITE }
  end
end
