require_relative "coordinates.rb"
require_relative "plateau.rb"
require_relative "rover.rb"

#           mission control - start
puts "Input the x and y coordinates of the plateau"
x, y = gets.split(" ")

plateau = Plateau.new(x,y)

  puts plateau.x
  puts plateau.y


ROVER_LIMIT = 2
#rovers = []

while plateau.rovers.count < ROVER_LIMIT do

  all_valid = false

  while all_valid == false

    validx = true
    validy = true
    valid_direction = true
    valid_instructions = true

    puts "Input the start position for rover #{plateau.rovers.count+1} (e.q. 1 2 N)"
    x, y, direction = gets.split(" ")

    puts "Please input the instructions for rover #{plateau.rovers.count+1} (e.g LMRMLM)"
    instructions = gets.chomp.split("")

    if (!(plateau.is_valid_x?(x)))
      validx = false
      puts "x value for rover #{plateau.rovers.count+1} needs to be equal to or less than #{plateau.x}"
    end

    if (!(plateau.is_valid_y?(y)))
      validy = false
      puts "y value value for rover #{plateau.rovers.count+1} needs to be equal to or less than #{plateau.y}"
    end

    # is valid direction
    if (!(Coordinates.is_valid_direction?(direction)))
      valid_direction = false
      puts "The directions you may select from for rover #{plateau.rovers.count+1} #{Coordinates::NORTH} #{Coordinates::SOUTH} #{Coordinates::EAST} #{Coordinates::WEST}!"
    end

    # are valid instructions
    if (!(Coordinates.is_valid_instructions?(instructions)))
      valid_instructions = false
      puts "The instructions must be one of the folloing #{Coordinates::LEFT} #{Coordinates::RIGHT} #{Coordinates::MOVE} with no spaces, for rover #{plateau.rovers.count+1}!"
    end

    if ((validx == true) && (validy == true) && (valid_direction == true)  && (valid_instructions == true))

        all_valid =true

        # create a new rover
        rover = Rover.new(x,y,direction, instructions)

        # add the current rover to the array
        plateau.rovers << rover

    end

  end

end

# Desktop/bitmaker/projects/object_oriented_programming


rover_count = 0

while rover_count  < plateau.rovers.length do

  # puts rovers[rover_count].x
  # puts rovers[rover_count].y

  plateau.rovers[rover_count].instructions.each do
  |instruction|

    plateau.rovers[rover_count].read_instruction(instruction)

  end

  rover_count +=1

end

rover_count = 0

while rover_count  < plateau.rovers.length do

  puts "Rover#{rover_count+1} x #{plateau.rovers[rover_count].x} y #{plateau.rovers[rover_count].y}  direction #{plateau.rovers[rover_count].direction} "

  rover_count +=1

end


#         mission control - end
