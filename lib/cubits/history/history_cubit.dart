import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mechanic_calculator/models/index.dart';
import 'package:mechanic_calculator/repository/index.dart';

part 'history_state.dart';

class HistoryCubit extends Cubit<HistoryState> {
  HistoryCubit({required this.repository}) : super(const HistoryState());

  final CalculatorRepository repository;

  Future<void> loadHistoryCubit() async {
    try {
      emit(state.copyWith(isLoading: true));
      final workItems = await repository.getAllCalculations(key: 'workItem');
      emit(
        state.copyWith(
          workItems: workItems,
          isLoading: false,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isError: true,
          errorMessage: e.toString(),
          isLoading: false,
        ),
      );
    }
  }
}
