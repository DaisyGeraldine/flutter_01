import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dbtables.dart';

class DBase{
  String name="dbase";
  int version=1;

  Future<Database>openDB() async{
    String path = join(await getDatabasesPath(), '$name.db',);
    return openDatabase(
      path,
      version: version,
      onConfigure: (db) async{
        await db.execute('PRAGMA foreign_keys = ON');
      },
      onCreate: (db, version) async{
        // ignore: avoid_function_literals_in_foreach_calls
        DbTable.tables.forEach((table) async{
          await db.execute(table);
        });
        /*await db.execute('''
          CREATE TABLE IF NOT EXISTS users(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            email TEXT,
            password TEXT
          )
        ''');*/
      }
    );
  }
}