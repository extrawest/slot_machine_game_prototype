import 'package:flutter/material.dart';
import 'package:slot_machine_game/widgets/common/background_gradient_scaffold.dart';

class SlotGamePlayScreen extends StatefulWidget {
  const SlotGamePlayScreen({Key? key}) : super(key: key);

  @override
  State<SlotGamePlayScreen> createState() => _SlotGamePlayScreenState();
}

class _SlotGamePlayScreenState extends State<SlotGamePlayScreen> {
  @override
  Widget build(BuildContext context) {
    return const GradientBackgroundScaffold(
      child: Text('gaga-gag'),
    );
  }
}
