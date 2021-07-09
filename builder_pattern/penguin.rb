class Penguin
  attr_accessor :beak_colour
  attr_accessor :height

  def self.build
    penguin = new
    yield(penguin)
    penguin
  end
end