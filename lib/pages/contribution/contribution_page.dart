import 'package:flutter/material.dart';
import 'package:mechanic_calculator/pages/contribution/contribution_list.dart';

class ContributionPage extends StatelessWidget {
  const ContributionPage({super.key});

  @override
  Widget build(BuildContext context) {
    const data = ContributionList.data;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Special Thanks To:'),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          final item = data[index];

          return ListTile(
            title: Text(item.name.toUpperCase()),
            subtitle: Text(item.description),
          );
        },
      ),
    );
  }
}
