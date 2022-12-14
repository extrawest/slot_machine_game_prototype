import 'package:flutter/material.dart';
import 'package:slot_machine_game/widgets/common/background_gradient_scaffold.dart';
import 'package:slot_machine_game/widgets/slot_game_play_screen/custom_slot_machine.dart';

class SlotGamePlayScreen extends StatefulWidget {
  const SlotGamePlayScreen({Key? key}) : super(key: key);

  @override
  State<SlotGamePlayScreen> createState() => _SlotGamePlayScreenState();
}

class _SlotGamePlayScreenState extends State<SlotGamePlayScreen> {
  @override
  Widget build(BuildContext context) {
    return const GradientBackgroundScaffold(
      child: Padding(
        padding: EdgeInsets.all(24.0),
        child: CustomSlotMachine(),
      ),
    );
  }
}
