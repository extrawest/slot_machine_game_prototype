import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:slot_machine_game/assets.dart';
import 'package:slot_machine_game/screens/slot_game_home_screen.dart';
import 'package:slot_machine_game/theme.dart';
import 'package:slot_machine_game/utils.dart';
import 'package:slot_machine_game/widgets/common/background_gradient_scaffold.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GradientBackgroundScaffold(
      child: FutureBuilder(
          future: Utils().loadGraphics(context),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const SlotGameHomeScreen();
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Slot Game',
                  style: TextStyles.h1Bold45,
                ),
                const SizedBox(height: 15),
                AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) => Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateY(_animationController.value * 2 * pi),
                    child: child,
                  ),
                  child: SvgPicture.asset(cherryIc, width: 50),
                ),
              ],
            );
          }),
    );
  }
}
