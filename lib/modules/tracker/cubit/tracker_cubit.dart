import 'dart:convert';
// import 'package:casino_buddy/models/budget_tracker_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leasure_buddy/modules/tracker/view/tracker_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'tracker_state.dart';

class TrackerCubit extends Cubit<TrackerState> {
  TrackerCubit() : super(TrackerState(camblingList: [])) {
    loadCamblingList();
  }

  void saveCamblingList(BudgetTracker cambling) {
    final stateCam = List<BudgetTracker>.from(state.camblingList);
    stateCam.add(cambling);
    emit(state.copyWith(camblingList: stateCam));
    _saveToPreferences(stateCam);
  }

  Future<void> _saveToPreferences(List<BudgetTracker> camblingList) async {
    final prefs = await SharedPreferences.getInstance();
    final String encodedData = jsonEncode(camblingList);
    await prefs.setString('camblingList', encodedData);
  }

  Future<void> loadCamblingList() async {
    final prefs = await SharedPreferences.getInstance();
    String? encodedData = prefs.getString('camblingList');
    if (encodedData != null) {
      try {
        final List<dynamic> decodedData = jsonDecode(encodedData);
        final List<BudgetTracker> camblingList = decodedData
            .map((e) => BudgetTracker.fromJson(e as Map<String, dynamic>))
            .toList();
        emit(state.copyWith(camblingList: camblingList));
      } catch (e) {
        print('Error loading camblingList: $e');
        await prefs.remove('camblingList');
      }
    }
  }
}
