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
        return this.european();
      case PARROT_TYPES.AFRICAN:
        return this.african();
      case PARROT_TYPES.NORWEGIAN_BLUE:
        return this.norwegianBlue();
    }
  }

  european() {
    return 12;
  }

  african() {
    return Math.max(0, 12 - 9 * this.numberOfCoconuts);
  }

  norwegianBlue() {
    return Math.min(24, this.voltage * 12);
  }
}
