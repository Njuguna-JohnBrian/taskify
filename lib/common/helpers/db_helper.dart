import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:taskify/common/models/task_model.dart';

class DBHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute(
      "CREATE TABLE todos("
      "id INTEGER PRIMARY KEY AUTOINCREMENT, "
      "title STRING, desc TEXT, date STRING, "
      "startTime STRING, endTime STRING, "
      "remind INTEGER, repeat STRING, "
      "isCompleted INTEGER)",
    );

    await database.execute(
      "CREATE TABLE user("
      "id INTEGER PRIMARY KEY AUTOINCREMENT, "
      "isVerified INTEGER DEFAULT 0)",
    );
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'taskify',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  static Future<int> createItem(TaskModel taskModel) async {
    final db = await DBHelper.db();

    final id = await db.insert(
      "todos",
      taskModel.toJson(),
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );

    return id;
  }

  static Future<int> createUser(int isVerified) async {
    final db = await DBHelper.db();

    final id = await db.insert(
      "user",
      {
        'id': 1,
        "isVerified": isVerified,
      },
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );

    return id;
  }

  static Future<List<Map<String, dynamic>>> getUser() async {
    final db = await DBHelper.db();

    return db.query(
      "user",
      orderBy: "id",
    );
  }

  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await DBHelper.db();

    return db.query(
      "todos",
      orderBy: "id",
    );
  }

  static Future<List<Map<String, dynamic>>> getItem(int id) async {
    final db = await DBHelper.db();

    return db.query(
      "todos",
      where: "id = ?",
      whereArgs: [id],
      limit: 1,
    );
  }

  static Future<int> updateItem(
    int id,
    String title,
    String description,
    int isCompleted,
    String date,
    String startTime,
    String endTime,
  ) async {
    final db = await DBHelper.db();

    final results = await db.update(
      "user",
      {
        'title': 1,
        "description": description,
        "isCompleted": isCompleted,
        "date": date,
        "startTime": startTime,
        "endTime": endTime,
      },
      where: "id = ?",
      whereArgs: [id],
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );

    return results;
  }

  static Future<void> deleteItem(int id) async {
    try {
      final db = await DBHelper.db();
      db.delete("todos", where: "id = ?", whereArgs: [id]);
    } catch (e) {
      debugPrint("Unable to delete $e");
    }
  }
}
