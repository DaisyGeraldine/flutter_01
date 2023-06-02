import 'package:drawer_views_project/DataBase/dbtables.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBase {
  //String name="dbase";
  int version=1;

  
  Future<Database>openDB() async{
    
    String path = join(await getDatabasesPath(), 'dbase.db');
    //await deleteDatabase(path);

    return openDatabase(
      path,
      version: version,
      onConfigure: (db) async{
        return await db.execute('PRAGMA foreign_keys = ON');
      },
      onCreate: (db, version) async{
        // ignore: avoid_function_literals_in_foreach_calls
        DbTable.tables.forEach((table) async{
        await db.execute(table);

      });

      print('Your database X v:$version created successfully');

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
  
  /*query(String sql, List<dynamic> arguments)async{
    final Database db=await openDB();
    //final List<Map<String, dynamic>> userMap = await db.query("user");
    //return await db.query(table);
    return await db.rawQuery(sql, arguments);
  }*/ 

  queryUsers() async {
    final Database db = await openDB();
    final List<Map<String, dynamic>> userMap = await db.query("user");

    return List.generate(userMap.length,
      (i) => Users(
        id: userMap[i]['id'],
        name: userMap[i]['name'],
        dni: userMap[i]['dni'],
        tipo: userMap[i]['tipo'],
        email: userMap[i]['email'],
        password: userMap[i]['password'],
        role: userMap[i]['role'],
        phone: userMap[i]['phone'],
        address: userMap[i]['address']
      )
    );
  }

  queryContacts() async {
    final Database db = await openDB();
    final List<Map<String, dynamic>> contactMap = await db.query("contact");

    return List.generate(contactMap.length,
      (i) => Contacts(
        id: contactMap[i]['id'],
        name: contactMap[i]['name'],
        role: contactMap[i]['role'],
        company: contactMap[i]['company'],
        phone: contactMap[i]['phone'],
        detail: contactMap[i]['detail'],
      )
    );
  }

  insert(Map<String, dynamic> data)async {
    final Database db=await openDB();
    print('Se acaba de agregar un registro, ${db.rawQuery('SELECT * FROM user')}');
    return await db.insert('user', data);
  }



}

class Users {
  final int ?id;
  final String ?name;
  final String ?dni;
  final String ?tipo;
  final String ?email;
  final String ?password;
  final String ?role;
  final String ?phone;
  final String ?address;

  Users({this.id, this.name, this.dni, this.tipo, this.email, this.password, this.role, this.phone, this.address});

  Map<String, dynamic> toJson(){
    return {'Nro': id, 'Nombre': name, 'Dni': dni, 'Tipo': tipo, 'Correo': email, 'Contraseña': password, 'Cargo': role, 'Telefono': phone, 'Direccion': address};
  }

}

class Contacts {
  final int ?id;
  final String ?name;
  final String ?role;
  final String ?company;
  final String ?phone;
  final String ?detail;

  Contacts({this.id, this.name, this.role, this.company, this.phone, this.detail});

  Map<String, dynamic> toJson(){
    return {'Nro': id, 'Nombre': name, 'Cargo': role, 'Empresa': company, 'Telefono': phone, 'Detalle': detail};
  }

}