import 'package:ingilizcekelimebulma_fy/models/Gorev.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbUtils {
  static final DbUtils _dbUtils = DbUtils._internal();
  DbUtils._internal();

  factory DbUtils() {
    return _dbUtils;
  }

  static Database _db;
  Future<Database> get db async {
    if (_db == null) {
      _db = await initializeDb();
    }
    return _db;
  }


  Future<Database> initializeDb() async {
    String path=join(await getDatabasesPath(), 'grv_database.db');
    var dbGorevler = await openDatabase(path, version: 1, onCreate: _createDb);
    return dbGorevler;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        "CREATE TABLE Gorevler(id INTEGER PRIMARY KEY, ilerleme INTEGER)");
  }

  Future<void> deleteTable() async {
    final Database db = await this.db;
    db.delete('Gorevler');
  }

  Future<void> insertGorev(Gorev gorev) async {
    final Database db = await this.db;
    await db.insert(
      'Gorevler',
      gorev.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

  }

  Future<List<Gorev>> gorevler() async {
    final Database db = await this.db;
    final List<Map<String, dynamic>> maps = await db.query('gorevler');
    return List.generate(maps.length, (i) {
      return Gorev(
        id: maps[i]['id'],
        ilerleme: maps[i]['ilerleme'],

      );
    });
  }

  Future<void> updateGorev(Gorev gorev) async {
    final db = await this.db;
    await db.update(
      'Gorevler',
      gorev.toMap(),
      where: "id = ?",
      whereArgs: [gorev.id],
    );
  }

  Future<void> deleteGorev(int id) async {
    final db = await this.db;
    await db.delete(
      'Gorevler',
      where: "id = ?",
      whereArgs: [id],
    );
  }



}