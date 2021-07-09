require "test/unit"
require_relative "penguin"

class PenguinTest < Test::Unit::TestCase
  def test_build_penguin_with_beak
    penguin = Penguin.build do |penguin|
      penguin.beak_colour = "orange"
    end

    assert_equal penguin.beak_colour, "orange"
  end

  def test_build_penguin_given_height
    penguin = Penguin.build do |penguin|
      penguin.height = 5.8
    end

    assert_equal penguin.height, 5.8
  end
end