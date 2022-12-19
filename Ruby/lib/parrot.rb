ParrotType = Struct.new(:type, :number_of_coconuts, :voltage, :nailed)

class EuropeanParrot < ParrotType
  def speed
    12
  end
end

class AfricanParrot < ParrotType
  def speed
    [12 - (9 * number_of_coconuts), 0].max
  end
end

class NorwegianBlueParrot < ParrotType
  def speed
    [voltage * 12, 24].min
  end
end

class Parrot < ParrotType
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
    end.new(*values)
  end
end
