import 'package:sqflite/sqflite.dart';

class AuthLocalDataSource {
  static const _databaseName = 'auth.db';
  static const _tableName = 'user_credentials';
  static AuthLocalDataSource? _instance;
  final Database database;

  AuthLocalDataSource._(this.database);

  static Future<AuthLocalDataSource> getInstance() async {
    if (_instance != null) return _instance!;

    final databasePath = await getDatabasesPath();
    final path = '$databasePath/$_databaseName';

    final database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE $_tableName(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            email TEXT NOT NULL UNIQUE,
            password TEXT NOT NULL
          )
        ''');
      },
    );

    _instance = AuthLocalDataSource._(database);
    return _instance!;
  }

  Future<bool> hasCredentials() async {
    final result = await database.query(_tableName, columns: ['id'], limit: 1);
    return result.isNotEmpty;
  }

  Future<bool> validateCredentials({
    required String email,
    required String password,
  }) async {
    final result = await database.query(
      _tableName,
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
      limit: 1,
    );
    return result.isNotEmpty;
  }

  Future<void> saveCredentials({
    required String email,
    required String password,
  }) async {
    await database.insert(_tableName, {
      'email': email,
      'password': password,
    }, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> clearCredentials() async {
    await database.delete(_tableName);
  }
}
