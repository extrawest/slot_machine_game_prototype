import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slot_machine/slot_machine.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:slot_machine_game/assets.dart';
import 'package:slot_machine_game/consts.dart';
import 'package:slot_machine_game/models/lottie_type.dart';
import 'package:slot_machine_game/repositories/slots_repository.dart';
import 'package:slot_machine_game/slot_machine_cubit/slot_machine_cubit.dart';
import 'package:slot_machine_game/widgets/common/common_lottie.dart';
import 'package:slot_machine_game/widgets/common/common_mouse_region.dart';
import 'package:slot_machine_game/widgets/slot_game_play_screen/prize_dialog.dart';
import 'package:slot_machine_game/widgets/slot_game_play_screen/stop_button.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class CommonSlotMachine extends StatefulWidget {
  const CommonSlotMachine({Key? key}) : super(key: key);

  @override
  State<CommonSlotMachine> createState() => _CommonSlotMachineState();
}

class _CommonSlotMachineState extends State<CommonSlotMachine> with TickerProviderStateMixin {
  late final SlotMachineController _slotMachineController;

  late final AnimationController _confettiLottieController;

  late final AnimationController _goldenLottieController;

  @override
  void initState() {
    _confettiLottieController = AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _goldenLottieController = AnimationController(vsync: this, duration: const Duration(seconds: 2));
    super.initState();
  }

  @override
  void dispose() {
    _confettiLottieController.dispose();
    _goldenLottieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<SlotMachineCubit, SlotMachineState>(
          listenWhen: (prev, curr) => prev.isAnySlotSpinning != curr.isAnySlotSpinning,
          listener: _slotMachineListener,
        ),
        BlocListener<SlotMachineCubit, SlotMachineState>(
          listenWhen: (prev, curr) => prev.prizeIndex != curr.prizeIndex,
          listener: _slotMachineStartListener,
        ),
      ],
      child: BlocBuilder<SlotMachineCubit, SlotMachineState>(
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
            _buildStopButtons(context, state),
            const SizedBox(height: 25),
            CommonMouseRegion(
              child: ZoomTapAnimation(
                key: const ValueKey(startMachineButtonKeyValue),
                onTap: () => (state.isFirstSlotSpinning || state.isSecondSlotSpinning || state.isThirdSlotSpinning)
                    ? null
                    : _onSlotMachineStart(context),
                child: SvgPicture.asset(playButton, width: 200),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStopButtons(BuildContext context, SlotMachineState state) {
    final slotMachineProvider = context.read<SlotMachineCubit>();
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StopButton(
            key: const ValueKey(stopFirstSlotButtonKeyValue),
            onPressed: state.isFirstSlotSpinning
                ? () {
                    slotMachineProvider.setSlotsValue(firstSlot: false);
                    _onSlotMachineStop(context, index: 0);
                  }
                : null,
          ),
          const SizedBox(width: 32),
          StopButton(
            key: const ValueKey(stopSecondSlotButtonKeyValue),
            onPressed: state.isSecondSlotSpinning
                ? () {
                    slotMachineProvider.setSlotsValue(secondSlot: false);
                    _onSlotMachineStop(context, index: 1);
                  }
                : null,
          ),
          const SizedBox(width: 32),
          StopButton(
            key: const ValueKey(stopThirdSlotButtonKeyValue),
            onPressed: state.isThirdSlotSpinning
                ? () {
                    slotMachineProvider.setSlotsValue(thirdSlot: false);
                    _onSlotMachineStop(context, index: 2);
                  }
                : null,
          ),
        ],
      ),
    );
  }

  List<Widget> _buildLotties(SlotMachineState state) {
    return [
      CommonLottie(
        lottieController: _confettiLottieController,
        lottie: confettiLottie,
      ),
      CommonLottie(
        lottieController: _goldenLottieController,
        lottie: goldenConfettiLottie,
      ),
    ];
  }

  Future<void> _slotMachineListener(BuildContext context, SlotMachineState state) async {
    if (!state.isAnySlotSpinning && state.currentPrize != null) {
      await _showPrizeDialog(state);
      _playLottie(state.currentPrize!.lottieType);
    }
  }

  void _slotMachineStartListener(BuildContext context, SlotMachineState state) {
    final slotMachineProvider = context.read<SlotMachineCubit>();
    _slotMachineController.start(hitRollItemIndex: state.prizeIndex);
    slotMachineProvider.setSlotsValue(
      firstSlot: true,
      secondSlot: true,
      thirdSlot: true,
    );
    slotMachineProvider.setPrize(state.prizeIndex);
  }

  Future<void> _showPrizeDialog(SlotMachineState state) async {
    await Future.delayed(const Duration(seconds: 1));
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => Stack(
        children: [
          Center(
            child: PrizeDialog(prize: state.currentPrize!),
          ),
          ..._buildLotties(state),
        ],
      ),
    );
  }

  void _playLottie(LottieType lottieType) {
    if (lottieType.isConfetti) {
      _confettiLottieController.forward().then((_) => _confettiLottieController.reset());
    } else if (lottieType.isGoldenConfetti) {
      _goldenLottieController.forward().then((_) => _goldenLottieController.reset());
    }
  }

  void _onSlotMachineStart(BuildContext context) {
    /// If this value is more than number of roll items
    /// then slot machine will show you 3 random different items
    context.read<SlotMachineCubit>().generateIndex();
  }

  void _onSlotMachineStop(BuildContext context, {required int index}) {
    _slotMachineController.stop(reelIndex: index);
  }
}
