import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:slot_machine_game/assets.dart';
import 'package:slot_machine_game/models/prize.dart';
import 'package:slot_machine_game/theme.dart';
import 'package:slot_machine_game/widgets/common/common_mouse_region.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class PrizeDialog extends StatefulWidget {
  final Prize prize;
  const PrizeDialog({required this.prize, Key? key}) : super(key: key);

  @override
  State<PrizeDialog> createState() => _PrizeDialogState();
}

class _PrizeDialogState extends State<PrizeDialog> with TickerProviderStateMixin {
  late final AnimationController _scaleAnimationController;
  late final Animation<double> _scaleAnimation;

  late final AnimationController _opacityAnimationController;
  late final Animation<double> _opacityAnimation;

  @override
  void initState() {
    _scaleAnimationController = AnimationController(duration: const Duration(seconds: 2), vsync: this)..forward();
    _scaleAnimation = CurvedAnimation(parent: _scaleAnimationController, curve: Curves.bounceOut);

    _opacityAnimationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
    _opacityAnimation = CurvedAnimation(parent: _opacityAnimationController, curve: Curves.easeIn);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 2), () => _opacityAnimationController.forward());
    });

    super.initState();
  }

  @override
  void dispose() {
    _scaleAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(widget.prize.asset),
          const SizedBox(height: 20),
          Text(widget.prize.name, style: TextStyles.bodyReg24),
          const SizedBox(height: 40),
          FadeTransition(
            opacity: _opacityAnimation,
            child: Transform.rotate(
              angle: pi,
              child: CommonMouseRegion(
                child: ZoomTapAnimation(
                  onTap: () => Navigator.pop(context),
                  child: SvgPicture.asset(arrowButton, width: 110),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
