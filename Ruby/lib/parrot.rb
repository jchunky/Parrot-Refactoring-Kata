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
    [24, voltage * 12].min
  end
end

class Parrot < Struct.new(:type, :number_of_coconuts, :voltage, :nailed)
  def speed
    return 0 if nailed

    parrot_type.speed
  end

  private

  def parrot_type
    type.to_s.classify.constantize.new(self)
  end
end
