import 'package:equatable/equatable.dart';

class WorkItemMdl extends Equatable {
  final String id;
  final int componentAmount;
  final double componentPrice;
  final int profitPercentageInHundred;

  const WorkItemMdl({
    this.id = '',
    this.componentAmount = 0,
    this.componentPrice = 0,
    this.profitPercentageInHundred = 0,
  });

  int get totalCapital =>
      (componentAmount * componentPrice).ceilToDouble().toInt();
  int get totalProfit =>
      (totalCapital * profitPercentageInHundred / 100).ceilToDouble().toInt();
  int get totalPrice => totalCapital + totalProfit;

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

    return WorkItemMdl(
      id: id,
      componentAmount: componentAmount,
      componentPrice: componentPrice,
      profitPercentageInHundred: profitPercentageInHundred,
    );
  }

  List<String> toStringList() {
    return [
      componentAmount.toString(),
      componentPrice.toString(),
      profitPercentageInHundred.toString(),
    ];
  }

  @override
  List<Object?> get props => [
        componentAmount,
        componentPrice,
        profitPercentageInHundred,
      ];
}
