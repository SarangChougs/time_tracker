import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  // Get the databse instance
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  // Initialize the databse
  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'worktime_tracker.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  // Create the database tables
  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE categories (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT
      );
    ''');

    await db.execute('''
      CREATE TABLE work_sessions (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        category_id INTEGER,
        start_time TEXT,
        pause_time TEXT,
        end_time TEXT,
        comments TEXT,
        FOREIGN KEY (category_id) REFERENCES categories(id)
      );
    ''');
  }

  // Insert a new category into database
  Future<int> insertCategory(String name) async {
    try {
      final db = await database;
      return await db.insert('categories', {'name': name});
    } catch (e) {
      if (kDebugMode) {
        print('Error inserting category: $e');
      }
      rethrow;
    }
  }

  // Insert work session into database
  Future<int> insertWorkSession(Map<String, dynamic> workSession) async {
    try {
      final db = await database;
      return await db.insert('work_sessions', workSession);
    } catch (e) {
      if (kDebugMode) {
        print('Error inserting category: $e');
      }
      rethrow;
    }
}

  // Fetch a work session from database
  Future<List<Map<String, dynamic>>> fetchWorkSessions() async {
    try {
      final db = await database;
      return await db.query('work_sessions');
    } catch (e) {
      if (kDebugMode) {
        print('Error inserting category: $e');
      }
      rethrow;
    }
  }
}
