export const PARROT_TYPES = {
  EUROPEAN: "EUROPEAN",
  AFRICAN: "AFRICAN",
  NORWEGIAN_BLUE: "NORWEGIAN_BLUE"
};

export class Parrot {
  constructor(type, numberOfCoconuts, voltage, isNailed) {
    this.type = type;
    this.numberOfCoconuts = numberOfCoconuts;
    this.voltage = voltage;
    this.isNailed = isNailed;
  }

  getSpeed() {
    if (this.isNailed) return 0;

    switch (this.type) {
      case PARROT_TYPES.EUROPEAN:
        return 12;
      case PARROT_TYPES.AFRICAN:
        return Math.max(0, 12 - 9 * this.numberOfCoconuts);
      case PARROT_TYPES.NORWEGIAN_BLUE:
        return Math.min(24, this.voltage * 12);
    }
  }
}
