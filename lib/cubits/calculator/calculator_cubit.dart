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
      final componentPrice = await repository.getComponentPrice();

      updateProfitPercentage(defaultProfitPercentage);
      updateComponentPrice(componentPrice);
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  void updateComponentAmountValues(String values) {
    final splittedNumberText = values.split('+');
    var total = 0;
    for (final numberText in splittedNumberText) {
      final number = int.tryParse(numberText) ?? 0;
      total += number;
    }

    _updateComponentAmount(total);
  }

  void _updateComponentAmount(int componentAmount) {
    emit(state.copyWith(componentAmount: componentAmount));
  }

  void updateProfitPercentage(double profitPercentage) {
    emit(state.copyWith(profitPercentage: profitPercentage));
  }

  void updateComponentPrice(double componentPrice) {
    emit(state.copyWith(componentPrice: componentPrice));
  }

  void updateIsRoundAllNumbers(bool? isRoundAllNumbers) {
    emit(state.copyWith(isRoundAllNumbers: isRoundAllNumbers));
  }

  void cancel() {
    emit(
      state.copyWith(
        componentAmount: 0,
        rebuildFlag: !state.rebuildFlag,
      ),
    );
  }

  Future<void> saveCalculationData(BuildContext context) async {
    try {
      emit(state.copyWith(isLoading: true));
      final workItem = WorkItemMdl(
        componentAmount: state.componentAmount,
        componentPrice: state.componentPrice,
        profitPercentageInHundred: state.profitPercentageInHundred,
        isRoundAllNumbers: state.isRoundAllNumbers,
      );

      await repository.saveCalculationData(workItem: workItem);
      await repository.saveProfitPercentage(state.profitPercentage);
      await repository.saveComponentPrice(state.componentPrice);
      emit(
        state.copyWith(
          componentAmount: 0,
          isLoading: false,
          rebuildFlag: !state.rebuildFlag,
        ),
      );
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
