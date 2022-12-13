import 'package:flutter/material.dart';
import 'package:slot_machine_game/widgets/common/background_gradient_scaffold.dart';
import 'package:slot_machine_game/widgets/home_screen/slot_game_main_menu.dart';

class SlotGameHomeScreen extends StatelessWidget {
  const SlotGameHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: GradientBackgroundScaffold(
        child: SlotGameMainMenu(),
      ),
    );
  }
}
