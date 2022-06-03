#!/usr/local/bin/ruby

# ########################################
# CMSC 330 - Project 1
# ########################################

#-----------------------------------------------------------
# FUNCTION DECLARATIONS
#-----------------------------------------------------------

# write your own functions here

#-----------------------------------------------------------
# the following is a parser that reads in a simpler version
# of the maze files.  Use it to get started writing the rest
# of the assignment.  You can feel free to move or modify 
# this function however you like in working on your assignment.

def read_and_print_simple_file(file)
  line = file.gets
  if line == nil then return end

  # read 1st line, must be maze header
  sz, sx, sy, ex, ey = line.split(/\s/)
  puts "header spec: size=#{sz}, start=(#{sx},#{sy}), end=(#{ex},#{ey})"

  # read additional lines
  while line = file.gets do

    # begins with "path", must be path specification
    if line[0...4] == "path"
      p, name, x, y, ds = line.split(/\s/)
      puts "path spec: #{name} starts at (#{x},#{y}) with dirs #{ds}"

    # otherwise must be cell specification (since maze spec must be valid)
    else
      x, y, ds, w = line.split(/\s/,4)
      puts "cell spec: coordinates (#{x},#{y}) with dirs #{ds}"
      ws = w.split(/\s/)
      ws.each {|w| puts "  weight #{w}"}
    end
  end
end

#----------------------------------
def main(command, fileName)
  maze_file = open(fileName)

  # perform command
  case command
  when "open"
    fail "unimplemented"
  when "parse"
    parse(maze_file)
  when "print"
    read_and_print_simple_file(maze_file)
  when "distance"
    fail "unimplemented"
  when "paths"
    fail "unimplemented"
  when "solve"
    fail "unimplemented"
  when "bridge"
    fail "unimplemented"
  when "sortcells"
    fail "unimplemented"
  else
    fail "Invalid command"
  end
end

