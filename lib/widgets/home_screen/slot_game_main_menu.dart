import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:slot_machine_game/assets.dart';
import 'package:slot_machine_game/routes.dart';
import 'package:slot_machine_game/theme.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class SlotGameMainMenu extends StatelessWidget {
  const SlotGameMainMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(
          flex: 2,
          child: Center(child: Text('Slot Game', style: TextStyles.h1Bold45)),
        ),
        Expanded(
          flex: 4,
          child: ZoomTapAnimation(
            onTap: () {
              Navigator.pushReplacementNamed(context, gameScreenRoute);
            },
            child: SvgPicture.asset(playButton),
          ),
        ),
      ],
    );
  }
}
