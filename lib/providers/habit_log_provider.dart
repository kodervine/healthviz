import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:healthviz/models/habit_log.dart';

class HabitNotifier extends StateNotifier<List<Habit>> {
  HabitNotifier() : super([]);

  // Add or update a habit
  void addHabit(String habitName, String value) {
    state = [
      ...state.where((habit) => habit.habitName != habitName),
      Habit(habitName, value),
    ];
  }

  Habit? getHabit(String habitName) {
    return state.firstWhere((habit) => habit.habitName == habitName,
        orElse: () => Habit(habitName, ""));
  }
}

final habitProvider = StateNotifierProvider<HabitNotifier, List<Habit>>((ref) {
  return HabitNotifier();
});
