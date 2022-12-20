part of 'slot_machine_cubit.dart';

class SlotMachineState extends Equatable {
  final bool isAnySlotSpinning;
  final bool isFirstSlotSpinning;
  final bool isSecondSlotSpinning;
  final bool isThirdSlotSpinning;
  final int? prizeIndex;

  final Prize? currentPrize;

  final bool shouldTriggerSlotMachine;

  final String? errorMessage;

  const SlotMachineState({
    this.isAnySlotSpinning = false,
    this.isFirstSlotSpinning = false,
    this.isSecondSlotSpinning = false,
    this.isThirdSlotSpinning = false,
    this.prizeIndex = 0,
    this.currentPrize,
    this.errorMessage,
    this.shouldTriggerSlotMachine = false,
  });

  SlotMachineState copyWith({
    bool? isAnySlotSpinning,
    bool? isFirstSlotSpinning,
    bool? isSecondSlotSpinning,
    bool? isThirdSlotSpinning,

    /// need this field because we have to pass to slotMachineController null value in some cases
    bool keepPrizeIndex = true,
    int? prizeIndex,
    Prize? currentPrize,
    bool keepPrize = true,
    bool shouldTriggerSlotMachine = false,
    String? errorMessage,
  }) {
    return SlotMachineState(
      isAnySlotSpinning: isAnySlotSpinning ?? this.isAnySlotSpinning,
      isFirstSlotSpinning: isFirstSlotSpinning ?? this.isFirstSlotSpinning,
      isSecondSlotSpinning: isSecondSlotSpinning ?? this.isSecondSlotSpinning,
      isThirdSlotSpinning: isThirdSlotSpinning ?? this.isThirdSlotSpinning,
      prizeIndex: prizeIndex ?? (keepPrizeIndex ? this.prizeIndex : null),
      currentPrize: currentPrize ?? (keepPrize ? this.currentPrize : null),
      shouldTriggerSlotMachine: shouldTriggerSlotMachine,
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
        shouldTriggerSlotMachine,
      ];
}
