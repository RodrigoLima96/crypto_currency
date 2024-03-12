import 'package:sqflite/sqflite.dart';

import 'local.dart';


class InitDatabaseService {
  InitDatabaseService._();

  static final InitDatabaseService instance = InitDatabaseService._();
  static Database? _database;

  get database async {
    if (_database != null) return _database;

    final initializer = CreateDatabaseService();
    _database = await initializer.createDatabase();
    return _database;
  }
}