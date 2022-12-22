require "active_support/all"
require "delegate"

class Parrot < Struct.new(:type, :number_of_coconuts, :voltage, :nailed)
  def self.build(type, *args)
    type.to_s.classify.constantize.new(type, *args)
  end

  def round(value)
    value.round(2)
  end
end

class EuropeanParrot < Parrot
  def speed
    12
  end
end

class AfricanParrot < Parrot
  def speed
    round([0, 12 - (9 * number_of_coconuts)].max)
  end
end

class NorwegianBlueParrot < Parrot
  def speed
    nailed ? 0 : [24, voltage * 12].min
  end
end
