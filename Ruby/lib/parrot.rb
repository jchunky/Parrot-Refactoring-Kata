require "delegate"
require "active_support/all"

class EuropeanParrot < SimpleDelegator
  def speed
    12
  end
end

class AfricanParrot < SimpleDelegator
  def speed
    [0, 12 - (9 * number_of_coconuts)].max
  end
end

class NorwegianBlueParrot < SimpleDelegator
  def speed
    nailed ? 0 : [24.0, voltage * 12].min
  end
end

class Parrot < Struct.new(:type, :number_of_coconuts, :voltage, :nailed)
  def speed
    type.to_s.classify.constantize.new(self).speed
  end
end
