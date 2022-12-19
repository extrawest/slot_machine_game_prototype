import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:slot_machine_game/assets.dart';
import 'package:slot_machine_game/widgets/common/background_gradient_scaffold.dart';
import 'package:slot_machine_game/widgets/common/common_mouse_region.dart';
import 'package:slot_machine_game/widgets/slot_game_play_screen/common_slot_machine.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class SlotGamePlayScreen extends StatefulWidget {
  const SlotGamePlayScreen({Key? key}) : super(key: key);

  @override
  State<SlotGamePlayScreen> createState() => _SlotGamePlayScreenState();
}

class _SlotGamePlayScreenState extends State<SlotGamePlayScreen> {
  @override
  Widget build(BuildContext context) {
    return GradientBackgroundScaffold(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              CommonMouseRegion(
                child: ZoomTapAnimation(
                  onTap: () => Navigator.pop(context),
                  child: SvgPicture.asset(homeButton, width: 100),
                ),
              ),
              const SizedBox(height: 50),
              const CommonSlotMachine(),
            ],
          ),
        ),
      ),
    );
  }
}
