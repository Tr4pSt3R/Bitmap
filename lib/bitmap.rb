require 'pry'
require 'matrix'

VALID_CMDS = ["init", "I", "C", "L", "V", "H", "F", "S", "X"]
WHITE = 0

@matrix;

def is_valid_command?( arg )
  VALID_CMDS.include? arg
end

# I M N -
# Aim: Create a new M x N image with all pixels coloured white (O)
# param(s): 2 of 2
# signature: I 3 2
def I(args)
  col, row = args.first, args.last
  @matrix = Matrix.build(col,row){ WHITE }
end

def S(*args)
  p @matrix
end

def main
  loop do
    print "(bitmap) > "
    a = gets.chomp        # get value from cmd prompt

    #a = a.split                     # split values on white space(s)
    # cmd, args = a.shift, a.map(&:to_i)  #separate cmd from args
    #
    # send(cmd, args )
    cmd = "X"
    break if ( cmd == "X")
  end
end

main
