import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mechanic_calculator/cubits/index.dart';
import 'package:mechanic_calculator/helpers/currency_helper.dart';
import 'package:mechanic_calculator/models/index.dart';
import 'package:mechanic_calculator/styles/index.dart';

class WorkItemCard extends StatelessWidget {
  const WorkItemCard({
    super.key,
    required this.index,
    required this.workItem,
  });

  final int index;
  final WorkItemMdl workItem;

  @override
  Widget build(BuildContext context) {
    print(workItem.totalProfit);
    final capitalText = CurrencyHelper.formattedDollarMoney(
      amount: workItem.totalCapital,
    );
    final profitText = CurrencyHelper.formattedDollarMoney(
      amount: workItem.totalProfit,
      prefix: '+',
    );
    final profitPercentageText = '${workItem.profitPercentageInHundred}%';

    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 8,
      ),
      child: ListTile(
        leading: Text(
          '#${index + 1}',
          style: TypoStyle.h3(context),
        ),
        title: Text('${workItem.componentAmount} Komponen digunakan'),
        subtitle: Text(
          '''Modal: $capitalText\nKeuntungan: $profitText ($profitPercentageText)''',
        ),
        trailing: GestureDetector(
          onTap: () => context.read<HistoryCubit>().removeWorkItem(
                context,
                workItem.id,
              ),
          child: const Icon(
            Icons.delete,
            color: ColorStyle.dangerColor,
          ),
        ),
      ),
    );
  }
}
