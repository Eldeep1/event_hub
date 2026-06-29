import 'package:event_hub/domain/model/event_model.dart';
import 'package:sqflite/sqflite.dart';

class SavedEventsLocalDataSource {
  static const _databaseName = 'saved_events.db';
  static const _tableName = 'saved_events';
  static SavedEventsLocalDataSource? _instance;
  final Database database;

  SavedEventsLocalDataSource._(this.database);

  static Future<SavedEventsLocalDataSource> getInstance() async {
    if (_instance != null) return _instance!;

    final databasePath = await getDatabasesPath();
    final path = '$databasePath/$_databaseName';

    final database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE $_tableName(
            id TEXT PRIMARY KEY,
            title TEXT NOT NULL,
            description TEXT,
            date TEXT,
            time TEXT,
            location TEXT,
            imageUrl TEXT,
            price REAL,
            organizerName TEXT
          )
        ''');
      },
    );

    _instance = SavedEventsLocalDataSource._(database);
    return _instance!;
  }

  Future<List<EventModel>> getSavedEvents() async {
    final rows = await database.query(_tableName);
    return rows.map((row) => EventModel.fromJson(row)).toList();
  }

  Future<void> saveEvent(EventModel event) async {
    await database.insert(
      _tableName,
      event.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> removeEvent(String eventId) async {
    await database.delete(_tableName, where: 'id = ?', whereArgs: [eventId]);
  }

  Future<bool> isSaved(String eventId) async {
    final rows = await database.query(
      _tableName,
      columns: ['id'],
      where: 'id = ?',
      whereArgs: [eventId],
      limit: 1,
    );
    return rows.isNotEmpty;
  }
}
