import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:slot_machine_game/assets.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class StopButton extends StatelessWidget {
  final VoidCallback? onPressed;
  const StopButton({this.onPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: pi / 2,
      child: ZoomTapAnimation(
        onTap: onPressed,
        child: SvgPicture.asset(arrowButton),
      ),
    );
  }
}
