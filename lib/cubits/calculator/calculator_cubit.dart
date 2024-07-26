import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mechanic_calculator/components/my_snackbar.dart';
import 'package:mechanic_calculator/constants/index.dart';
import 'package:mechanic_calculator/models/index.dart';
import 'package:mechanic_calculator/repository/index.dart';

part 'calculator_state.dart';

class CalculatorCubit extends Cubit<CalculatorState> {
  CalculatorCubit({required this.repository}) : super(const CalculatorState());

  final CalculatorRepository repository;

  Future<void> onBuild() async {
    emit(state.copyWith(isLoading: true));
    try {
      final defaultProfitPercentage = await repository.getProfitPercentage();
      updateProfitPercentage(defaultProfitPercentage);
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  void updateComponentAmount(int componentAmount) {
    emit(state.copyWith(componentAmount: componentAmount));
  }

  void updateProfitPercentage(double profitPercentage) {
    emit(state.copyWith(profitPercentage: profitPercentage));
  }

  void resetAllField() {
    emit(const CalculatorState());
  }

  Future<void> saveCalculationData(BuildContext context) async {
    try {
      emit(state.copyWith(isLoading: true));
      final workItem = WorkItemMdl(
        componentAmount: state.componentAmount,
        componentPrice: CommonConstant.componentBasePrice,
        profitPercentageInHundred: state.profitPercentageInHundred,
      );

      await repository.saveCalculationData(workItem: workItem);
      await repository.saveProfitPercentage(state.profitPercentage);
      emit(state.copyWith(componentAmount: 0, isLoading: false));
      MySnackbar.show(
        // ignore: use_build_context_synchronously
        context,
        title: 'Berhasil',
        message: 'Data berhasil disimpan',
        contentType: ContentType.success,
      );
    } catch (e) {
      MySnackbar.show(
        // ignore: use_build_context_synchronously
        context,
        title: 'Gagal',
        message: 'Data gagal disimpan (${e.toString()})',
        contentType: ContentType.failure,
      );
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }
}
