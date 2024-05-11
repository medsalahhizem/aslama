import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._instance();
  static Database? _database;

  DatabaseHelper._instance();

  String userTable = 'user_table';
  String colId = 'id';
  String colUsername = 'username';
  String colEmail = 'email';
  String colPassword = 'password';

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initDB();
    return _database;
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'aslama.db');

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE $userTable (
      $colId INTEGER PRIMARY KEY AUTOINCREMENT,
      $colUsername TEXT NOT NULL,
      $colEmail TEXT NOT NULL,
      $colPassword TEXT NOT NULL
    )
  ''');
    await db.execute('''
    CREATE TABLE booking_table (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      user_id INTEGER NOT NULL,
      hotel_name TEXT NOT NULL,
      start_date TEXT NOT NULL,
      end_date TEXT NOT NULL,
      adults INTEGER NOT NULL,
      children INTEGER NOT NULL,
      FOREIGN KEY (user_id) REFERENCES $userTable($colId)
    )
  ''');
  }

  Future<int> insertUser(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    return await db!.insert(userTable, row);
  }

  Future<List<Map<String, dynamic>>> queryAllUsers() async {
    Database? db = await instance.database;
    return await db!.query(userTable);
  }

  Future<Map<String, dynamic>?> getUserByUsername(String username) async {
    Database? db = await instance.database;
    List<Map<String, dynamic>> result = await db!
        .query(userTable, where: '$colUsername = ?', whereArgs: [username]);
    return result.isNotEmpty ? result.first : null;
  }

  Future<int> insertBooking(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    return await db!.insert('booking_table', row);
  }
}
