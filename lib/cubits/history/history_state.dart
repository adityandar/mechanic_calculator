part of 'history_cubit.dart';

class HistoryState extends Equatable {
  final List<WorkItemMdl> workItems;
  final bool isLoading;
  final bool isError;
  final String errorMessage;

  const HistoryState({
    this.workItems = const [],
    this.isLoading = false,
    this.isError = false,
    this.errorMessage = '',
  });

  double get totalCapital => workItems.fold(
        0,
        (previous, current) => previous + current.totalCapital,
      );

  double get totalProfit => workItems.fold(
        0,
        (previous, current) => previous + current.totalProfit,
      );

  int get totalComponent => workItems.fold(
        0,
        (previous, current) => previous + current.componentAmount,
      );

  HistoryState copyWith({
    List<WorkItemMdl>? workItems,
    bool? isLoading,
    bool? isError,
    String? errorMessage,
  }) {
    return HistoryState(
      workItems: workItems ?? this.workItems,
      isLoading: isLoading ?? this.isLoading,
      isError: isError ?? this.isError,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [workItems, isLoading, isError, errorMessage];
}
