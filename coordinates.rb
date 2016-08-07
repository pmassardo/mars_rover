#     Coordinates - start
class Coordinates

  LEFT = 'L'
  RIGHT = 'R'
  MOVE = 'M'

  NORTH = "N"
  SOUTH = "S"
  EAST = "E"
  WEST = "W"

  # name accessor/mutator
  attr_accessor :x
  attr_accessor :y

  def initialize(x,y)

    @x = x
    @y = y

  end

  def self.is_valid_direction?(direction)

    returnValue = true

    if((direction.upcase() != NORTH) &&
      (direction.upcase() != SOUTH) &&
      (direction.upcase() != EAST) &&
      (direction.upcase() != WEST))

      returnValue = false

    end

    return returnValue

  end

  def self.is_valid_instructions?(instructions)

    returnValue = true

    # LEFT = 'L'
    # RIGHT = 'R'
    # MOVE = 'M'

    instructions.each { |instruction|

      # puts "#{instruction} instr"

      if((instruction.upcase != LEFT) &&
          (instruction.upcase != RIGHT) &&
          (instruction.upcase != MOVE))

          returnValue = false

      end

    }

    # puts "#{returnValue} bool"

    return returnValue

  end

end

#     Coordinates - end
