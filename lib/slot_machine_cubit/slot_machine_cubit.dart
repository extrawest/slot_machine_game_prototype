import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'slot_machine_state.dart';

class SlotMachineCubit extends Cubit<SlotMachineState> {
  SlotMachineCubit() : super(const SlotMachineState());

  void setFirstSlotValue({bool? firstSlot, bool? secondSlot, bool? thirdSlot}) {
    emit(state.copyWith(
      isFirstSlotSpinning: firstSlot,
      isSecondSlotSpinning: secondSlot,
      isThirdSlotSpinning: thirdSlot,
    ));
  }
}
