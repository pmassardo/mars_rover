#     Plateau - start
class Plateau < Coordinates

  attr_reader :rovers

  def initialize(x,y)

    super(x,y)
    @rovers =[]

  end

  def add(rover)
      @rovers << rover
  end

  def is_valid_x?(xExternal)

    valid = true

    if @x.to_i < xExternal.to_i || xExternal.to_i < 0
      valid = false
    end

    return valid

  end

  def is_valid_y?(yExternal)

    valid = true

    if @y.to_i < yExternal.to_i || yExternal.to_i < 0
      valid = false
    end

    return valid

  end

end
#     Plateau - end
