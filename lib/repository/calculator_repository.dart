import 'package:mechanic_calculator/constants/index.dart';
import 'package:mechanic_calculator/models/work_item_mdl.dart';
import 'package:uuid/uuid.dart';

import '../services/index.dart';

class CalculatorRepository {
  const CalculatorRepository({
    required this.localStorageService,
  });

  final LocalStorageService localStorageService;

  Future<void> saveCalculationData({required WorkItemMdl workItem}) async {
    final key = const Uuid().v4();

    final usedKey = '${CommonConstant.localStorageWorkItemPrefix}$key';

    final workItemStringList = workItem.toStringList();

    await localStorageService.saveStringListData(usedKey, workItemStringList);
  }

  Future<List<WorkItemMdl>> getAllCalculations({required String key}) async {
    final allKeys = await localStorageService.getAllKeys();
    final results = List<WorkItemMdl>.empty(growable: true);

    for (final key in allKeys) {
      if (key.startsWith(CommonConstant.localStorageWorkItemPrefix)) {
        final rawItem = await localStorageService.getStringListData(key);
        final workItem = WorkItemMdl.fromStringList(
          id: key,
          stringList: rawItem,
        );

        if (workItem != const WorkItemMdl()) {
          results.add(workItem);
        }
      }
    }

    return results;
  }

  Future<void> saveProfitPercentage(double value) async {
    const key = CommonConstant.localStorageProfitPercentageKey;

    await localStorageService.saveDoubleData(key, value);
  }

  Future<double> getProfitPercentage() async {
    const key = CommonConstant.localStorageProfitPercentageKey;

    return localStorageService.getDoubleData(key);
  }

  Future<void> removeOneWorkItem(String id) async {
    await localStorageService.removeItem(id);
  }
}
