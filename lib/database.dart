class CarSearch {
  String bodytype;
  //String color;

  CarSearch(this.bodytype);
}
/*
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart' as sql;

class CarDatabase {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE items(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        name TEXT,
        bodytype TEXT,
        color TEXT
      )
      """);
  }

  

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'car.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  static Future<int> createItem(
      String name, String bodytype, String color) async {
    final db = await CarDatabase.db();

    final data = {'name': name, 'bodytype': bodytype, 'color': color};
    final id = await db.insert('items', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<List<Map<String, dynamic>>> getCars() async {
    final db = await CarDatabase.db();
    return db.query('items', orderBy: "id");
  }

  static Future<List<Map<String, dynamic>>> getItem(int id) async {
    final db = await CarDatabase.db();
    return db.query('items', where: "id = ?", whereArgs: [id], limit: 1);
  }

  static Future<int> updateItem(
      int id, String name, String bodytype, String color) async {
    final db = await CarDatabase.db();

    final data = {'name': name, 'bodytype': bodytype, 'color': color};

    final result =
        await db.update('items', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  static Future<void> deleteItem(int id) async {
    final db = await CarDatabase.db();
    try {
      await db.delete("items", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }
}
*/
