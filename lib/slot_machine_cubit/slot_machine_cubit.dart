import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slot_machine_game/consts.dart';
import 'package:slot_machine_game/models/prize.dart';
import 'package:slot_machine_game/repositories/slots_repository.dart';

part 'slot_machine_state.dart';

class SlotMachineCubit extends Cubit<SlotMachineState> {
  SlotMachineCubit() : super(const SlotMachineState());

  void setFirstSlotValue(bool value) {
    emit(state.copyWith(isFirstSlotSpinning: value));
    _checkIfAnySlotSpinning();
  }

  void setSecondSlotValue(bool value) {
    emit(state.copyWith(isSecondSlotSpinning: value));
    _checkIfAnySlotSpinning();
  }

  void setThirdSlotValue(bool value) {
    emit(state.copyWith(isThirdSlotSpinning: value));
    _checkIfAnySlotSpinning();
  }

  void _checkIfAnySlotSpinning() {
    emit(state.copyWith(
      isAnySlotSpinning: state.isFirstSlotSpinning || state.isSecondSlotSpinning || state.isThirdSlotSpinning,
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
    /// If this value is more than number of roll items
    /// then slot machine will show you 3 random different items
    final index = Random().nextInt(16);
    emit(state.copyWith(prizeIndex: index <= 7 ? index : null, keepPrizeIndex: false, shouldTriggerSlotMachine: true));
  }
}
