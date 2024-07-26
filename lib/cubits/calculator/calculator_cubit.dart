import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mechanic_calculator/constants/index.dart';

part 'calculator_state.dart';

class CalculatorCubit extends Cubit<CalculatorState> {
  CalculatorCubit() : super(const CalculatorState());

  void updateComponentAmount(int componentAmount) {
    emit(state.copyWith(componentAmount: componentAmount));
  }

  void updateProfitPercentage(double profitPercentage) {
    emit(state.copyWith(profitPercentage: profitPercentage));
  }

  void resetAllField() {
    emit(const CalculatorState());
  }
}
