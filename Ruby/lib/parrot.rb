class Parrot < Struct.new(:type, :number_of_coconuts, :voltage, :nailed)
  PARROTS = {
    european_parrot: ->(_parrot) { 12 },
    african_parrot: ->(parrot) { 12 - (9 * parrot.number_of_coconuts) },
    norwegian_blue_parrot: ->(parrot) { parrot.voltage * 12 },
  }

  def speed
    return 0 if nailed

    PARROTS[type].call(self).clamp(0..24)
  end
end
