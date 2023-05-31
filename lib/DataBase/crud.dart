import 'package:drawer_views_project/DataBase/db.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

abstract class Crud{
  final String table;
  const Crud(this.table);

  Future<Database>get database async {
    //return Database.get(this.table);
    return await DBase().openDB();
  }

  query(String sql, List<dynamic> arguments)async{
    final db = await database;
    //return await db.query(table);
    return await db.rawQuery(sql, arguments);
  }

  /*Future<int> insert(Map<String, dynamic> row);
  Future<List<Map<String, dynamic>>> queryAllRows();
  Future<int> queryRowCount();
  Future<int> update(Map<String, dynamic> row);
  Future<int> delete(int id);
  Future<int> deleteAll();*/


insert(Map<String, dynamic>data)async {
  final db=await database;
  return await db.insert(table, data);
}

}