require_relative "penguin"
require_relative "penguin_validations"

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
