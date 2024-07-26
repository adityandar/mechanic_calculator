import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:gap/gap.dart';
import 'package:mechanic_calculator/pages/history/views/index.dart';
import 'package:mechanic_calculator/styles/index.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyle.blackColor,
      body: CustomScrollView(
        slivers: [
          SliverStickyHeader(
            header: const HistoryStickyHeaderView(),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  const HistoryNotStickyHeaderView(),
                  const Gap(16),
                  ...List.generate(
                    10,
                    (index) => Card(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 8,
                      ),
                      child: ListTile(
                        leading: Text(
                          '#${index + 1}',
                          style: TypoStyle.h3(context),
                        ),
                        title: Text('500 Komponen digunakan'),
                        subtitle: Text(
                          '''Modal: \$500\nKeuntungan: \$100 (2%)''',
                        ),
                      ),
                    ),
                  ),
                  const Gap(24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
