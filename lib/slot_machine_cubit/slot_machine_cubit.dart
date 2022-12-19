import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slot_machine_game/consts.dart';
import 'package:slot_machine_game/models/prize.dart';
import 'package:slot_machine_game/repositories/slots_repository.dart';

part 'slot_machine_state.dart';

class SlotMachineCubit extends Cubit<SlotMachineState> {
  SlotMachineCubit() : super(const SlotMachineState());

  void setSlotsValue({bool? firstSlot, bool? secondSlot, bool? thirdSlot}) {
    emit(state.copyWith(
      isAnySlotSpinning: (firstSlot ?? state.isFirstSlotSpinning) ||
          (secondSlot ?? state.isSecondSlotSpinning) ||
          (thirdSlot ?? state.isThirdSlotSpinning),
      isFirstSlotSpinning: firstSlot,
      isSecondSlotSpinning: secondSlot,
      isThirdSlotSpinning: thirdSlot,
    ));
  }

  void setPrize(int? prizeIndex) {
    try {
      final prize = prizes[prizeIndex];
      emit(state.copyWith(currentPrize: prize, keepPrize: false));
    } catch (e) {
      emit(state.copyWith(errorMessage: defaultErrorMessage));
    }
  }

  void generateIndex() {
    final index = Random().nextInt(16);
    emit(state.copyWith(prizeIndex: index <= 7 ? index : null, keepPrizeIndex: false));
  }
}
