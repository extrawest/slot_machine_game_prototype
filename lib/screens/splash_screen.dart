import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:slot_machine_game/assets.dart';
import 'package:slot_machine_game/routes.dart';
import 'package:slot_machine_game/theme.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _loadComposition();
      _precacheImages(() {
        if (!mounted) {
          return;
        }
        Navigator.pushReplacementNamed(context, homeScreenRoute);
      });
    });
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
      child: Column(
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
      ),
    );
  }

  Future<void> _precacheImages(VoidCallback onSuccess) async {
    await precacheImage(Image.asset(boardIc).image, context);
    await precachePicture(ExactAssetPicture(SvgPicture.svgStringDecoderBuilder, playButton), null);
    await precachePicture(ExactAssetPicture(SvgPicture.svgStringDecoderBuilder, arrowButton), null);
    await precachePicture(ExactAssetPicture(SvgPicture.svgStringDecoderBuilder, homeButton), null);

    await precachePicture(ExactAssetPicture(SvgPicture.svgStringDecoderBuilder, seventhIc), null);
    await precachePicture(ExactAssetPicture(SvgPicture.svgStringDecoderBuilder, appleIc), null);
    await precachePicture(ExactAssetPicture(SvgPicture.svgStringDecoderBuilder, barIc), null);
    await precachePicture(ExactAssetPicture(SvgPicture.svgStringDecoderBuilder, lemonIc), null);
    await precachePicture(ExactAssetPicture(SvgPicture.svgStringDecoderBuilder, coinIc), null);
    await precachePicture(ExactAssetPicture(SvgPicture.svgStringDecoderBuilder, watermelonIc), null);
    await precachePicture(ExactAssetPicture(SvgPicture.svgStringDecoderBuilder, crownIc), null);
    onSuccess.call();
  }

  Future<void> _loadComposition() async {
    await AssetLottie(confettiLottie).load();
    await AssetLottie(goldenConfettiLottie).load();
  }
}
