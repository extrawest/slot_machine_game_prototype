import 'package:flutter/cupertino.dart';
import 'package:slot_machine_game/screens/slot_game_gameplay.dart';
import 'package:slot_machine_game/screens/slot_game_home_screen.dart';

const homeScreenRoute = '/home_screen_route';
const gameScreenRoute = '/game_screen_route';

Map<String, WidgetBuilder> applicationRoutes = <String, WidgetBuilder>{
  homeScreenRoute: (context) => const SlotGameHomeScreen(),
  gameScreenRoute: (context) => const SlotGamePlayScreen(),
};