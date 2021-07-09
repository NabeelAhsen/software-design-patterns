class PenguinBuilder
  attr_reader :penguin

  def self.build
    builder = new
    yield(builder)
    builder.penguin
  end

  def initialize
    @penguin = Penguin.new
  end

  def set_beak_colour(colour)
    @penguin.beak_colour = colour
  end

  def set_height(height)
    @penguin.height = height
  end
end

class Penguin
  attr_accessor :beak_colour
  attr_accessor :height
end
