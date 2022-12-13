import 'package:flutter/material.dart';

class SlotGameMainMenu extends StatelessWidget {
  const SlotGameMainMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text('Slot Game', style: TextStyle()),
      ],
    );
  }
}
