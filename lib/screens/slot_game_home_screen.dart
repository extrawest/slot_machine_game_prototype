import 'package:flutter/material.dart';
import 'package:slot_machine_game/widgets/home_screen/slot_game_main_menu.dart';

class SlotGameHomeScreen extends StatelessWidget {
  const SlotGameHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              Color(0xff433431),
              Color(0xff6f4337),
            ],
          ),
        ),
        child: const SlotGameMainMenu(),
      ),
    );
  }
}
