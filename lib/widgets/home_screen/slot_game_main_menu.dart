import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:slot_machine_game/assets.dart';
import 'package:slot_machine_game/routes.dart';
import 'package:slot_machine_game/theme.dart';
import 'package:slot_machine_game/widgets/common/common_mouse_region.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

const playButtonKeyValue = 'playButtonKey';

class SlotGameMainMenu extends StatelessWidget {
  const SlotGameMainMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Center(child: Text('Slot Game', style: TextStyles.h1Bold45)),
        const SizedBox(height: 30),
        CommonMouseRegion(
          child: ZoomTapAnimation(
            key: const ValueKey(playButtonKeyValue),
            onTap: () {
              Navigator.pushNamed(context, gameScreenRoute);
            },
            child: SvgPicture.asset(playButton),
          ),
        ),
      ],
    );
  }
}
