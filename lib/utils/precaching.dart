import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:slot_machine_game/assets.dart';

class Precaching {
  Future<bool> loadGraphics(BuildContext context) async {
    await _precacheImages(context);
    await _loadComposition();
    return true;
  }

  Future<void> _precacheImages(BuildContext context) async {
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
  }

  Future<void> _loadComposition() async {
    await AssetLottie(confettiLottie).load();
    await AssetLottie(goldenConfettiLottie).load();
  }
}
