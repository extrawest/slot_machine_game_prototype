import 'package:flutter/cupertino.dart';
import 'package:slot_machine_game/screens/slot_game_gameplay.dart';
import 'package:slot_machine_game/screens/slot_game_home_screen.dart';
import 'package:slot_machine_game/screens/splash_screen.dart';

const splashScreenRoute = '/splash_screen_route';
const homeScreenRoute = '/home_screen_route';
const gameScreenRoute = '/game_screen_route';

Map<String, WidgetBuilder> applicationRoutes = <String, WidgetBuilder>{
  splashScreenRoute: (context) => const SplashScreen(),
  homeScreenRoute: (context) => const SlotGameHomeScreen(),
  gameScreenRoute: (context) => const SlotGamePlayScreen(),
};