VALID_CMDS = ["I", "C", "L", "V", "H", "F", "S", "X"]

def is_valid_command?( arg )
  VALID_CMDS.include? arg
end

def main
  cmd = "I"
  while( cmd != "X" ) do
    print "(bitmap) > "
    a = gets.chomp
    cmd = a[0]
  end
end

main
