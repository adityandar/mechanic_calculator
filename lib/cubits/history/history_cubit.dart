import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mechanic_calculator/components/my_snackbar.dart';
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

  Future<void> removeWorkItem(BuildContext context, String id) async {
    try {
      await repository.removeOneWorkItem(id);

      MySnackbar.show(
        // ignore: use_build_context_synchronously
        context,
        title: 'Berhasil',
        message: 'Data berhasil dihapus',
        contentType: ContentType.success,
      );

      await loadHistoryCubit();
    } catch (e) {
      MySnackbar.show(
        // ignore: use_build_context_synchronously
        context,
        title: 'Gagal',
        message: 'Data gagal dihapus (${e.toString()})',
        contentType: ContentType.failure,
      );
    }
  }
}
