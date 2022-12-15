import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slot_machine/slot_machine.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:slot_machine_game/assets.dart';
import 'package:slot_machine_game/slot_machine_cubit/slot_machine_cubit.dart';
import 'package:slot_machine_game/utils.dart';
import 'package:slot_machine_game/widgets/slot_game_play_screen/stop_button.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class CustomSlotMachine extends StatefulWidget {
  const CustomSlotMachine({Key? key}) : super(key: key);

  @override
  State<CustomSlotMachine> createState() => _CustomSlotMachineState();
}

class _CustomSlotMachineState extends State<CustomSlotMachine> {
  late final SlotMachineController _slotMachineController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SlotMachineCubit, SlotMachineState>(
      listenWhen: (prev, curr) => prev.isAnySlotSpinning != curr.isAnySlotSpinning,
      listener: _slotMachineListener,
      builder: (context, state) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Transform.scale(
            scale: 1.5,
            child: Container(
              margin: const EdgeInsets.all(40.0),
              padding: const EdgeInsets.only(top: 20),
              height: 205,
              width: 280,
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage(boardIc), fit: BoxFit.cover),
              ),
              child: AbsorbPointer(
                child: SlotMachine(
                  reelHeight: 100,
                  reelItemExtent: 40,
                  reelSpacing: 6,
                  rollItems: rollItems,
                  onCreated: (controller) {
                    _slotMachineController = controller;
                  },
                  onFinished: (controller) {},
                ),
              ),
            ),
          ),
          const SizedBox(height: 25),
          _buildStopButtons(state),
          const SizedBox(height: 25),
          ZoomTapAnimation(
            onTap: () => (state.isFirstSlotSpinning || state.isSecondSlotSpinning || state.isThirdSlotSpinning)
                ? null
                : _onSlotMachineStart(),
            child: SvgPicture.asset(playButton, width: 200),
          ),
        ],
      ),
    );
  }

  Widget _buildStopButtons(SlotMachineState state) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StopButton(
            onPressed: state.isFirstSlotSpinning
                ? () {
                    context.read<SlotMachineCubit>().setSlotsValue(firstSlot: false);
                    _onSlotMachineStop(index: 0);
                  }
                : null,
          ),
          const SizedBox(width: 32),
          StopButton(
            onPressed: state.isSecondSlotSpinning
                ? () {
                    context.read<SlotMachineCubit>().setSlotsValue(secondSlot: false);
                    _onSlotMachineStop(index: 1);
                  }
                : null,
          ),
          const SizedBox(width: 32),
          StopButton(
            onPressed: state.isThirdSlotSpinning
                ? () {
                    context.read<SlotMachineCubit>().setSlotsValue(thirdSlot: false);
                    _onSlotMachineStop(index: 2);
                  }
                : null,
          ),
        ],
      ),
    );
  }

  void _slotMachineListener(BuildContext context, SlotMachineState state) {
    if (!state.isAnySlotSpinning) {
      print('finish');
    }
  }

  void _onSlotMachineStart() {
    final index = Random().nextInt(20);
    print(index);
    _slotMachineController.start(hitRollItemIndex: index <= 7 ? index : null);
    context.read<SlotMachineCubit>().setSlotsValue(
          firstSlot: true,
          secondSlot: true,
          thirdSlot: true,
        );
    context.read<SlotMachineCubit>().setPrize(index);
  }

  void _onSlotMachineStop({required int index}) {
    _slotMachineController.stop(reelIndex: index);
  }
}
