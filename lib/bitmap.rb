VALID_CMDS = ["I", "C", "L", "V", "H", "F", "S", "X"]

def is_valid_command?( arg )
  VALID_CMDS.include? arg
end

# I M N -
# Aim: Create a new M x N image with all pixels coloured white (O)
# param(s): 2 of 2
# signature: I 3 2
def I(args)
  p "M = #{args.first}"
  p "N = #{args.last}"

  M.times do
    N.times do
      print "0 "
    end
    print "\n"
  end
end

def main
  cmd = "I"
  while( cmd != "X" ) do
    print "(bitmap) > "
    a = gets.chomp
    a = a.split           #split on white space
    cmd = a.shift         #grab command
    args = a.map(&:to_i)  #params of the command, cmd
    send(cmd, args)
  end
end

main
