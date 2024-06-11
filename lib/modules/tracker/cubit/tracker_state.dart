part of 'tracker_cubit.dart';

class TrackerState {
  TrackerState({required this.camblingList});

  final List<BudgetTracker> camblingList;

  TrackerState copyWith({
    List<BudgetTracker>? camblingList,
  }) {
    return TrackerState(
      camblingList: camblingList ?? this.camblingList,
    );
  }
}
