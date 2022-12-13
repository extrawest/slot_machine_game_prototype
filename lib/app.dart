import 'package:flutter/material.dart';
import 'package:slot_machine_game/routes.dart';
import 'package:slot_machine_game/screens/slot_game_home_screen.dart';
import 'package:slot_machine_game/theme.dart';

class SlotMachineApp extends StatelessWidget {
  const SlotMachineApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      routes: applicationRoutes,
      initialRoute: splashScreenRoute,
      home: const SlotGameHomeScreen(),
    );
  }
}
