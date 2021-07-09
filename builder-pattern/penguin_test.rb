require "test/unit"
require_relative "penguin"

class PenguinTest < Test::Unit::TestCase
  def test_build_penguin_specifying_beak_colour
    penguin = PenguinBuilder.build do |builder|
      builder.set_beak_colour("orange")
    end

    assert_equal penguin.beak_colour, "orange"
  end

  def test_build_beak_colour_can_only_be_string
    assert_raises do
      PenguinBuilder.build do |builder|
        builder.set_beak_colour(true)
      end
    end
  end

  def test_build_beak_colour_must_be_a_valid_beak_colour
    assert_raises do
      PenguinBuilder.build do |builder|
        builder.set_beak_colour("blue")
      end
    end
  end

  def test_build_penguin_given_height
    penguin = PenguinBuilder.build do |builder|
      builder.set_height(5.8)
    end

    assert_equal penguin.height, 5.8
  end

  def test_build_penguin_height_must_be_not_be_integer
    assert_raises do
      PenguinBuilder.build do |builder|
        builder.set_height(5)
      end
    end
  end

  def test_build_penguin_height_must_be_a_float
    assert_raises do
      PenguinBuilder.build do |builder|
        builder.set_height("5.8")
      end
    end
  end
end