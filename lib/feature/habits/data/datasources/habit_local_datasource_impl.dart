import 'package:curso_clean_arch/core/database/app_database.dart';
import 'package:curso_clean_arch/core/tables/habits_table.dart';
import 'package:curso_clean_arch/feature/habits/data/datasources/habit_local_datasource.dart';
import 'package:curso_clean_arch/feature/models/habit_model.dart';
import 'package:sqflite/sqflite.dart';

class HabitLocalDataSourceImpl implements HabitLocalDataSource {
  Future<Database> get _db async => AppDatabase.instance;

  @override
  Future<void> deleteHabit(String id) async {
    final db = await _db;

    await db.delete(habitsTableName, where: 'id = ?', whereArgs: [id]);
  }

  @override
  Future<List<HabitModel>> getHabits() async {
    final db = await _db;

    final List<Map<String, dynamic>> rows = await db.query(habitsTableName);
    return rows.map(HabitModel.fromMap).toList();
  }

  @override
  Future<void> insertHabit(HabitModel habit) async {
    final db = await _db;

    await db.insert(
      habitsTableName,
      habit.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<void> updateHabit(HabitModel habit) async {
    final db = await _db;

    await db.update(
      habitsTableName,
      habit.toMap(),
      where: 'id = ?',
      whereArgs: [habit.id],
    );
  }
}
