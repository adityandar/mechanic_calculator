import 'package:equatable/equatable.dart';

class WorkItemMdl extends Equatable {
  final String id;
  final int componentAmount;
  final double componentPrice;
  final int profitPercentageInHundred;
  final bool isRoundAllNumbers;

  const WorkItemMdl({
    this.id = '',
    this.componentAmount = 0,
    this.componentPrice = 0,
    this.profitPercentageInHundred = 0,
    this.isRoundAllNumbers = true,
  });

  double get totalCapital => isRoundAllNumbers
      ? (componentAmount * componentPrice).roundToDouble()
      : componentAmount * componentPrice;
  double get totalProfit => isRoundAllNumbers
      ? (totalCapital * profitPercentageInHundred / 100).roundToDouble()
      : totalCapital * profitPercentageInHundred / 100;
  double get totalPrice => totalCapital + totalProfit;

  WorkItemMdl copyWith({
    String? id,
    int? componentAmount,
    double? componentPrice,
    int? profitPercentageInHundred,
  }) {
    return WorkItemMdl(
      id: id ?? this.id,
      componentAmount: componentAmount ?? this.componentAmount,
      componentPrice: componentPrice ?? this.componentPrice,
      profitPercentageInHundred:
          profitPercentageInHundred ?? this.profitPercentageInHundred,
    );
  }

  factory WorkItemMdl.fromStringList({
    required String id,
    required List<String> stringList,
  }) {
    final componentAmount =
        int.tryParse(stringList.elementAtOrNull(0) ?? '') ?? 0;
    final componentPrice =
        double.tryParse(stringList.elementAtOrNull(1) ?? '') ?? 0;
    final profitPercentageInHundred =
        int.tryParse(stringList.elementAtOrNull(2) ?? '') ?? 0;
    final isRoundAllNumbers =
        bool.tryParse(stringList.elementAtOrNull(3) ?? '') ?? true;

    return WorkItemMdl(
      id: id,
      componentAmount: componentAmount,
      componentPrice: componentPrice,
      profitPercentageInHundred: profitPercentageInHundred,
      isRoundAllNumbers: isRoundAllNumbers,
    );
  }

  List<String> toStringList() {
    return [
      componentAmount.toString(),
      componentPrice.toString(),
      profitPercentageInHundred.toString(),
      isRoundAllNumbers.toString(),
    ];
  }

  @override
  List<Object?> get props => [
        componentAmount,
        componentPrice,
        profitPercentageInHundred,
        isRoundAllNumbers,
      ];
}
