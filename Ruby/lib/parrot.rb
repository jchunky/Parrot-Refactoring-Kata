Parrot = Struct.new(:type, :number_of_coconuts, :voltage, :nailed) do
  def speed
    return 0 if nailed

    send(type)
  end

  private

  def african_parrot
    [12 - 9 * number_of_coconuts, 0].max
  end

  def european_parrot
    12
  end

  def norwegian_blue_parrot
    [voltage * 12, 24].min
  end
end
