import 'package:flutter_slot_machine/slot_machine.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:slot_machine_game/assets.dart';

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