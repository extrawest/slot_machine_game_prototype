class Prize {
  final PrizeType prizeType;
  final String asset;
  final String name;

  const Prize({
    required this.asset,
    required this.prizeType,
    required this.name,
  });
}

enum PrizeType {
  bar,
  cherry,
  seventh,
  apple,
  lemon,
  coin,
  watermelon,
  crown,
}

extension PrizeTypeExt on PrizeType {
  bool get isBar => this == PrizeType.bar;
  bool get isCherry => this == PrizeType.cherry;
  bool get isSeventh => this == PrizeType.seventh;
  bool get isApple => this == PrizeType.apple;
  bool get isLemon => this == PrizeType.lemon;
  bool get isCoin => this == PrizeType.coin;
  bool get isWatermelon => this == PrizeType.watermelon;
  bool get isCrown => this == PrizeType.crown;
}
