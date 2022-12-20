import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:slot_machine_game/app.dart';
import 'package:slot_machine_game/assets.dart';
import 'package:slot_machine_game/utils/logger.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLogger();
  // Need this asset for splash screen
  await precachePicture(ExactAssetPicture(SvgPicture.svgStringDecoderBuilder, cherryIc), null);
  runApp(const SlotMachineApp());
}
