part of 'calculator_cubit.dart';

class CalculatorState extends Equatable {
  final double componentPrice;
  final int componentAmount;
  final double profitPercentage;
  final bool isRoundAllNumbers;
  final bool isLoading;
  final bool rebuildFlag;

  const CalculatorState({
    this.componentPrice = CommonConstant.componentBasePrice,
    this.componentAmount = 0,
    this.profitPercentage = 0,
    this.isRoundAllNumbers = true,
    this.isLoading = false,
    this.rebuildFlag = false,
  });

  int get profitPercentageInHundred => (profitPercentage * 100).toInt();

  double get totalCapital => isRoundAllNumbers
      ? (componentAmount * componentPrice).roundToDouble()
      : componentAmount * componentPrice;
  double get totalProfit => isRoundAllNumbers
      ? (totalCapital * profitPercentage).roundToDouble()
      : totalCapital * profitPercentage;
  double get totalPrice => totalCapital + totalProfit;

  CalculatorState copyWith({
    double? componentPrice,
    int? componentAmount,
    double? profitPercentage,
    bool? isRoundAllNumbers,
    bool? isLoading,
    bool? rebuildFlag,
  }) {
    return CalculatorState(
      componentPrice: componentPrice ?? this.componentPrice,
      componentAmount: componentAmount ?? this.componentAmount,
      profitPercentage: profitPercentage ?? this.profitPercentage,
      isLoading: isLoading ?? this.isLoading,
      isRoundAllNumbers: isRoundAllNumbers ?? this.isRoundAllNumbers,
      rebuildFlag: rebuildFlag ?? this.rebuildFlag,
    );
  }

  @override
  List<Object?> get props => [
        componentPrice,
        componentAmount,
        profitPercentage,
        isLoading,
        isRoundAllNumbers,
        rebuildFlag,
      ];
}
