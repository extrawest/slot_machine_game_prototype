part of 'slot_machine_cubit.dart';

class SlotMachineState extends Equatable {
  final bool isAnySlotSpinning;
  final bool isFirstSlotSpinning;
  final bool isSecondSlotSpinning;
  final bool isThirdSlotSpinning;
  final int prizeIndex;

  final Prize? currentPrize;

  final String? errorMessage;

  const SlotMachineState({
    this.isAnySlotSpinning = false,
    this.isFirstSlotSpinning = false,
    this.isSecondSlotSpinning = false,
    this.isThirdSlotSpinning = false,
    this.prizeIndex = 0,
    this.currentPrize,
    this.errorMessage,
  });

  SlotMachineState copyWith({
    bool? isAnySlotSpinning,
    bool? isFirstSlotSpinning,
    bool? isSecondSlotSpinning,
    bool? isThirdSlotSpinning,
    int? prizeIndex,
    Prize? currentPrize,
    String? errorMessage,
  }) {
    return SlotMachineState(
      isAnySlotSpinning: isAnySlotSpinning ?? this.isAnySlotSpinning,
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
        isAnySlotSpinning,
        isFirstSlotSpinning,
        isSecondSlotSpinning,
        isThirdSlotSpinning,
        prizeIndex,
        currentPrize,
        errorMessage,
      ];
}
