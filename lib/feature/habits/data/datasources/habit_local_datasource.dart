abstract class HabitLocalDataSource {
  Future<void> insertHabit(Map<String, dynamic> habit);
  Future<List<Map<String, dynamic>>> getHabits();
  Future<void> updateHabit(Map<String, dynamic> habit);
  Future<void> deleteHabit(Map<String, dynamic> habit);
}
