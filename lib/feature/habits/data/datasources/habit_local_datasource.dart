import 'package:curso_clean_arch/feature/models/habit_model.dart';

abstract class HabitLocalDataSource {
  Future<void> insertHabit(HabitModel habit);
  Future<List<HabitModel>> getHabits();
  Future<void> updateHabit(HabitModel habit);
  Future<void> deleteHabit(String id);
}
