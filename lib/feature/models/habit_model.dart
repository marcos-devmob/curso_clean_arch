import 'package:curso_clean_arch/core/tables/habits_table.dart';

class HabitModel {
  final String id;
  final String title;
  final DateTime createdAt;

  const HabitModel({
    required this.id,
    required this.title,
    required this.createdAt,
  });

  factory HabitModel.fromMap(Map<String, dynamic> map) {
    return HabitModel(
      id: map[habitsTableId] as String,
      title: map[habitsTableTitle] as String,
      createdAt: DateTime.parse(map[habitsTableCreatedAt] as String),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      habitsTableId: id,
      habitsTableTitle: title,
      habitsTableCreatedAt: createdAt.toIso8601String(),
    };
  }
}
