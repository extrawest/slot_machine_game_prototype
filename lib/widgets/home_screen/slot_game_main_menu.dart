import 'package:flutter/material.dart';
import 'package:slot_machine_game/theme.dart';

class SlotGameMainMenu extends StatelessWidget {
  const SlotGameMainMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: const [
        Text('Slot Game', style: TextStyles.h1Bold45),
      ],
    );
  }
}
