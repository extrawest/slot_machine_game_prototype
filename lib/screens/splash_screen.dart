import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
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
  Widget build(BuildContext context) {
    return const GradientBackgroundScaffold(
      child: Center(
        child: Text(
          'Slot Game',
          style: TextStyles.h1Bold45,
        ),
      ),
    );
  }

  Future<void> _precacheImages(VoidCallback onSuccess) async {
    await precacheImage(Image.asset(boardIc).image, context);
    await precachePicture(ExactAssetPicture(SvgPicture.svgStringDecoderBuilder, playButton), null);
    await precachePicture(ExactAssetPicture(SvgPicture.svgStringDecoderBuilder, arrowButton), null);
    await precachePicture(ExactAssetPicture(SvgPicture.svgStringDecoderBuilder, homeButton), null);

    await precachePicture(ExactAssetPicture(SvgPicture.svgStringDecoderBuilder, seventhIc), null);
    await precachePicture(ExactAssetPicture(SvgPicture.svgStringDecoderBuilder, cherryIc), null);
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
