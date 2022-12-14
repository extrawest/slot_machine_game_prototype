import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_slot_machine/slot_machine.dart';
import 'package:slot_machine_game/utils.dart';
import 'package:slot_machine_game/widgets/slot_game_play_screen/stop_button.dart';

class CustomSlotMachine extends StatefulWidget {
  const CustomSlotMachine({Key? key}) : super(key: key);

  @override
  State<CustomSlotMachine> createState() => _CustomSlotMachineState();
}

class _CustomSlotMachineState extends State<CustomSlotMachine> {
  late final SlotMachineController _slotMachineController;


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Transform.scale(
            scale: 1.5,
            child: SlotMachine(
              rollItems: rollItems,
              onCreated: (controller) {
                _slotMachineController = controller;
              },
              onFinished: (controller) {},
            ),
          ),
        ),
        const SizedBox(height: 25),
        _buildStopButtons(),
        const SizedBox(height: 25),
        TextButton(
          onPressed: () => _onSlotMachineStart(),
          child: const Text('dsadsadsa'),
        ),
      ],
    );
  }

  Widget _buildStopButtons() {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: StopButton(
              onPressed: () => _onSlotMachineStop(index: 0),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: StopButton(
              onPressed: () => _onSlotMachineStop(index: 1),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: StopButton(
              onPressed: () => _onSlotMachineStop(index: 2),
            ),
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
