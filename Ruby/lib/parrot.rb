require "delegate"

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
    case type
    when :european_parrot then EuropeanParrot
    when :african_parrot then AfricanParrot
    when :norwegian_blue_parrot then NorwegianBlueParrot
    end.new(self)
  end
end
