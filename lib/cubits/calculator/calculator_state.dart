part of 'calculator_cubit.dart';

class CalculatorState extends Equatable {
  final int componentAmount;
  final double profitPercentage;

  const CalculatorState({
    this.componentAmount = 0,
    this.profitPercentage = 0,
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
  }) {
    return CalculatorState(
      componentAmount: componentAmount ?? this.componentAmount,
      profitPercentage: profitPercentage ?? this.profitPercentage,
    );
  }

  @override
  List<Object?> get props => [componentAmount, profitPercentage];
}
