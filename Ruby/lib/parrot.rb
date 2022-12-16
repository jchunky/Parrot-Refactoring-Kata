class EuropeanParrot < Struct.new(:type, :number_of_coconuts, :voltage, :nailed)
  def speed
    12
  end
end

class AfricanParrot < Struct.new(:type, :number_of_coconuts, :voltage, :nailed)
  def speed
    [12 - (9 * number_of_coconuts), 0].max
  end
end

class NorwegianBlueParrot < Struct.new(:type, :number_of_coconuts, :voltage, :nailed)
  def speed
    [voltage * 12, 24].min
  end
end

class Parrot < Struct.new(:type, :number_of_coconuts, :voltage, :nailed)
  def speed
    return 0 if nailed

    build_parrot.new(*values).speed
  end

  private

  def build_parrot
    case type
    when :european_parrot then EuropeanParrot
    when :african_parrot then AfricanParrot
    when :norwegian_blue_parrot then NorwegianBlueParrot
    end
  end
end
