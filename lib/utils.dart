import 'package:flutter_slot_machine/slot_machine.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:slot_machine_game/assets.dart';
import 'package:slot_machine_game/models/prize.dart';

List<RollItem> rollItems = <RollItem>[
  RollItem(index: 0, child: SvgPicture.asset(seventhIc)),
  RollItem(index: 1, child: SvgPicture.asset(cherryIc)),
  RollItem(index: 2, child: SvgPicture.asset(appleIc)),
  RollItem(index: 3, child: SvgPicture.asset(crownIc)),
  RollItem(index: 4, child: SvgPicture.asset(barIc)),
  RollItem(index: 5, child: SvgPicture.asset(coinIc)),
  RollItem(index: 6, child: SvgPicture.asset(lemonIc)),
  RollItem(index: 7, child: SvgPicture.asset(watermelonIc)),
];

final Map<int, Prize> prizes = <int, Prize>{
  0: const Prize(asset: seventhIc, prizeType: PrizeType.seventh, name: 'Jackpot'),
  1: const Prize(asset: cherryIc, prizeType: PrizeType.cherry, name: 'Cherry'),
  2: const Prize(asset: appleIc, prizeType: PrizeType.apple, name: 'Apple'),
  3: const Prize(asset: crownIc, prizeType: PrizeType.crown, name: 'Crown'),
  4: const Prize(asset: barIc, prizeType: PrizeType.bar, name: 'Bar'),
  5: const Prize(asset: coinIc, prizeType: PrizeType.coin, name: 'Coins'),
  6: const Prize(asset: lemonIc, prizeType: PrizeType.lemon, name: 'Lemon'),
  7: const Prize(asset: watermelonIc, prizeType: PrizeType.watermelon, name: 'Watermelon'),
};
