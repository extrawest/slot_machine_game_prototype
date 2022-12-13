import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_slot_machine/slot_machine.dart';
import 'package:slot_machine_game/widgets/common/background_gradient_scaffold.dart';

class SlotGamePlayScreen extends StatefulWidget {
  const SlotGamePlayScreen({Key? key}) : super(key: key);

  @override
  State<SlotGamePlayScreen> createState() => _SlotGamePlayScreenState();
}

class _SlotGamePlayScreenState extends State<SlotGamePlayScreen> {
  late final SlotMachineController _slotMachineController;

  @override
  Widget build(BuildContext context) {
    return GradientBackgroundScaffold(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SlotMachine(
              rollItems: const [
                RollItem(index: 1, child: Icon(Icons.add)),
                RollItem(index: 1, child: Icon(Icons.access_alarm_outlined)),
                RollItem(index: 1, child: Icon(Icons.account_balance_rounded)),
                RollItem(index: 1, child: Icon(Icons.ad_units_sharp)),
              ],
              onCreated: (controller) {
                _slotMachineController = controller;
              },
              onFinished: (controller) {},
            ),
          ),
          const SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 72,
                  height: 44,
                  child: TextButton(
                      child: Text('STOP'),
                      onPressed: () => _onSlotMachineStop(index: 0)),
                ),
                const SizedBox(width: 8),
                SizedBox(
                  width: 72,
                  height: 44,
                  child: TextButton(
                      child: Text('STOP'),
                      onPressed: () => _onSlotMachineStop(index: 1)),
                ),
                const SizedBox(width: 8),
                SizedBox(
                  width: 72,
                  height: 44,
                  child: TextButton(
                      child: Text('STOP'),
                      onPressed: () => _onSlotMachineStop(index: 2)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 25),
          TextButton(
            onPressed: () => _onSlotMachineStart(),
            child: const Text('dsadsadsa'),
          ),
        ],
      ),
    );
  }

  void _onSlotMachineStart() {
    final index = Random().nextInt(20);
    _slotMachineController.start(hitRollItemIndex: index < 5 ? index : null);
  }

  void _onSlotMachineStop({required int index}) {
    _slotMachineController.stop(reelIndex: index);
  }
}
