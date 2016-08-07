#     Rover - start
class Rover < Coordinates

  @@count = 0

  attr_accessor :direction
  attr_reader :instructions

  def self.count()
    return @@count
  end

  def initialize(x,y, direction, instructions)

    super(x,y)
    @direction = direction
    @instructions = instructions
    @@count += 1

    # puts "count #{@@count}"

  end

  def read_instruction(instruction)

    # determine if this is a move
    # or a direction shift
    if ((instruction.upcase == LEFT) ||
        (instruction.upcase == RIGHT))

        # shift direction and pass the direction
        # to shift
        turn(instruction)

    elsif (instruction.upcase == MOVE)

        # call the move method
        move()

    end

  end

  # move - moves the item one space
  # based on the current direction
  def move()

    # if north or south
    # add or subtract from the y coordinate
    # if east or west
    # add or subtract from the x coordinate
    case @direction
      when NORTH
          @y = @y.to_i + 1
      when SOUTH
          @y = @y.to_i - 1
      when EAST
          @x= @x.to_i + 1
      when WEST
          @x= @x.to_i - 1
    end

    # test - remove
    # puts "move #{@x} #{@y}"

  end

  # turn - turns the item based on the current direction and a shift left or right
  def turn(instruction)

    # if the current direction is north moving left will change the direction to west else east
    # if the current direction is south moving left will change the direction to east else west
    # if the current direction is east moving left will change the direction to north else south
    # if the current direction is west moving left will change the direction to south else north
    case @direction
      when NORTH
          @direction = (instruction == LEFT)? WEST : EAST
      when SOUTH
          @direction = (instruction == LEFT)? EAST : WEST
      when EAST
          @direction = (instruction == LEFT)? NORTH : SOUTH
      when WEST
          @direction = (instruction == LEFT)? SOUTH : NORTH
    end

    # # test - remove
    # puts "turn #{@direction}"

  end

end
# Rover - end
