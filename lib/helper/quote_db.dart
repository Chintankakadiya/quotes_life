import 'package:sqflite/sqflite.dart';

import '../modal/quote_modal.dart';

class QuoteDatabaseHelper {
  QuoteDatabaseHelper._();
  static final QuoteDatabaseHelper quoteDatabaseHelper =
      QuoteDatabaseHelper._();
  String tableName = 'quote';
  String colName = 'name';
  Database? db;
  Future<Database> initDatabase() async {
    var db = await openDatabase("myDb.db");
    String dataBasePath = await getDatabasesPath();
    String path = dataBasePath + 'myDB.db';
    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int vision) async {
      await db.execute(
          "CREATE TABLE IF NOT EXISTS $tableName(id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT);");
    });
    return db;
  }

  Future<void> insertData({int? id, required List<Quotes>? allQuotes}) async {
    db = await initDatabase();
    allQuotes?.forEach((element) async {
      String query = (element.quote.contains("'"))
          ? "INSERT INTO $tableName($colName)VALUES('When you have a dream,you have got to grab it and never let go');"
          : "INSERT INTO $tableName($colName)VALUES ('${element.quote})";

      await db!.rawInsert(query);
    });
  }

  Future<List<Quotes>> fetchAllData() async {
    db = await initDatabase();
    String query = 'SELECT * FROM $tableName';
    List<Map<String, dynamic>> res = await db!.rawQuery(query);
    List<Quotes> quoteData = res.map((e) => Quotes.fromDB(data: e)).toList();
    return quoteData;
  }

  Future<int> deleteAllData() async {
    db = await initDatabase();
    String query = 'DELETE FROM $tableName';
    return await db!.rawDelete(query);
  }
}
