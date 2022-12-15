part of 'slot_machine_cubit.dart';

class SlotMachineState extends Equatable {
  final bool isFirstSlotSpinning;
  final bool isSecondSlotSpinning;
  final bool isThirdSlotSpinning;
  final int prizeIndex;

  final Prize? currentPrize;

  final String? errorMessage;

  const SlotMachineState({
    this.isFirstSlotSpinning = false,
    this.isSecondSlotSpinning = false,
    this.isThirdSlotSpinning = false,
    this.prizeIndex = 0,
    this.currentPrize,
    this.errorMessage,
  });

  SlotMachineState copyWith({
    bool? isFirstSlotSpinning,
    bool? isSecondSlotSpinning,
    bool? isThirdSlotSpinning,
    int? prizeIndex,
    Prize? currentPrize,
    String? errorMessage,
  }) {
    return SlotMachineState(
      isFirstSlotSpinning: isFirstSlotSpinning ?? this.isFirstSlotSpinning,
      isSecondSlotSpinning: isSecondSlotSpinning ?? this.isSecondSlotSpinning,
      isThirdSlotSpinning: isThirdSlotSpinning ?? this.isThirdSlotSpinning,
      prizeIndex: prizeIndex ?? this.prizeIndex,
      currentPrize: currentPrize ?? this.currentPrize,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        isFirstSlotSpinning,
        isSecondSlotSpinning,
        isThirdSlotSpinning,
        prizeIndex,
        currentPrize,
        errorMessage,
      ];
}
