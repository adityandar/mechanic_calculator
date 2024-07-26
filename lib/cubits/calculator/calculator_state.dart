part of 'calculator_cubit.dart';

class CalculatorState extends Equatable {
  final int componentAmount;
  final double profitPercentage;
  final bool isLoading;

  const CalculatorState({
    this.componentAmount = 0,
    this.profitPercentage = 0,
    this.isLoading = false,
  });

  int get profitPercentageInHundred => (profitPercentage * 100).toInt();

  int get totalCapital => (componentAmount * CommonConstant.componentBasePrice)
      .ceilToDouble()
      .toInt();
  int get totalProfit =>
      (totalCapital * profitPercentage).ceilToDouble().toInt();
  int get totalPrice => totalCapital + totalProfit;

  CalculatorState copyWith({
    int? componentAmount,
    double? profitPercentage,
    bool? isLoading,
  }) {
    return CalculatorState(
      componentAmount: componentAmount ?? this.componentAmount,
      profitPercentage: profitPercentage ?? this.profitPercentage,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [
        componentAmount,
        profitPercentage,
        isLoading,
      ];
}
