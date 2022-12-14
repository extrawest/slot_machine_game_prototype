part of 'slot_machine_cubit.dart';

class SlotMachineState extends Equatable {
  final bool isFirstSlotSpinning;
  final bool isSecondSlotSpinning;
  final bool isThirdSlotSpinning;

  const SlotMachineState({
    this.isFirstSlotSpinning = false,
    this.isSecondSlotSpinning = false,
    this.isThirdSlotSpinning = false,
  });

  SlotMachineState copyWith({
    bool? isFirstSlotSpinning,
    bool? isSecondSlotSpinning,
    bool? isThirdSlotSpinning,
  }) {
    return SlotMachineState(
      isFirstSlotSpinning: isFirstSlotSpinning ?? this.isFirstSlotSpinning,
      isSecondSlotSpinning: isSecondSlotSpinning ?? this.isSecondSlotSpinning,
      isThirdSlotSpinning: isThirdSlotSpinning ?? this.isThirdSlotSpinning,
    );
  }

  @override
  List<Object?> get props => [
        isFirstSlotSpinning,
        isSecondSlotSpinning,
        isThirdSlotSpinning,
      ];
}
