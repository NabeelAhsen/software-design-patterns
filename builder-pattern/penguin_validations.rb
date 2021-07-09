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
