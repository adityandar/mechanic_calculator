import 'package:flutter/material.dart';
import 'package:mechanic_calculator/styles/index.dart';

class ToolShortcutBottomSheet extends StatelessWidget {
  const ToolShortcutBottomSheet({super.key});

  static Future<void> show(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      backgroundColor: ColorStyle.fullWhiteColor,
      builder: (context) {
        return const ToolShortcutBottomSheet();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CheckboxListTile(
            value: false,
            title: Text('Ganti Ban (Motor)'),
            subtitle: Text('50 Komponen'),
            onChanged: (_) {},
          ),
          CheckboxListTile(
            value: false,
            title: Text('Ganti Ban (Mobil)'),
            subtitle: Text('100 Komponen'),
            onChanged: (_) {},
          ),
          CheckboxListTile(
            value: false,
            title: Text('Ganti Ban (Mobil)'),
            subtitle: Text('100 Komponen'),
            onChanged: (_) {},
          ),
          CheckboxListTile(
            value: false,
            title: Text('Upgrade Mesin'),
            subtitle: Text('400 Komponen'),
            onChanged: (_) {},
          ),
          CheckboxListTile(
            value: false,
            title: Text('Upgrade Body'),
            subtitle: Text('400 Komponen'),
            onChanged: (_) {},
          ),
          CheckboxListTile(
            value: false,
            title: Text('Upgrade Fuel Tank'),
            subtitle: Text('400 Komponen'),
            onChanged: (_) {},
          ),
          CheckboxListTile(
            value: false,
            title: Text('Upgrade Alarm'),
            subtitle: Text('400 Komponen'),
            onChanged: (_) {},
          ),
        ],
      ),
    );
  }
}
