class Parrot < Struct.new(:type, :number_of_coconuts, :voltage, :nailed)
  MIN_PARROT_SPEED = 0
  MAX_PARROT_SPEED = 24

  PARROTS = {
    european_parrot: ->(_parrot) { 12 },
    african_parrot: ->(parrot) { (12 - (9 * parrot.number_of_coconuts)) },
    norwegian_blue_parrot: ->(parrot) { (parrot.voltage * 12) },
  }

  def speed
    validate_type
    return 0 if nailed

    calaculate_speed
  end

  private

  def validate_type
    raise "Invalid parrot type: #{type}" unless PARROTS.key?(type)
  end

  def calaculate_speed
    PARROTS[type].call(self).clamp(MIN_PARROT_SPEED, MAX_PARROT_SPEED)
  end
end
