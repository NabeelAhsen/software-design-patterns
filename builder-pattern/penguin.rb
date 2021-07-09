module PenguinValidations
  VALID_BEAK_COLOURS = [
    "orange",
    "red",
    "green",
    "yellow"
  ]

  def validate_beak_colour(colour)
    raise StandardError unless VALID_BEAK_COLOURS.include?(colour)

    colour
  end

  def validate_height(height)
    raise StandardError unless height.kind_of? Float

    height
  end
end

class PenguinBuilder
  include PenguinValidations

  def self.build
    builder = new
    yield(builder)
    builder.penguin
  end

  attr_reader :penguin

  def initialize
    @penguin = Penguin.new
  end

  def set_beak_colour(colour)
    @penguin.beak_colour = validate_beak_colour(colour)
  end

  def set_height(height)
    @penguin.height = validate_height(height)
  end
end

class Penguin
  attr_accessor :beak_colour
  attr_accessor :height
end
