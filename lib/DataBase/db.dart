import 'dart:math';
import 'package:drawer_views_project/DataBase/dbtables.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBase {
  //String name="dbase";
  int version = 1;

  Future<Database> openDB() async {
    String path = join(await getDatabasesPath(), 'dbase.db');
    print(path);
    //await deleteDatabase(path);

    return openDatabase(path, version: version, onConfigure: (db) async {
      return await db.execute('PRAGMA foreign_keys = ON');
    }, onCreate: (db, version) async {
      // ignore: avoid_function_literals_in_foreach_calls
      DbTable.tables.forEach((table) async {
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
    });
  }

  /*query(String sql, List<dynamic> arguments)async{
    final Database db=await openDB();
    //final List<Map<String, dynamic>> userMap = await db.query("user");
    //return await db.query(table);
    return await db.rawQuery(sql, arguments);
  }*/


/// Query the database for all users

  Future<List<Users>> queryUserById(int idUser) async {
    final Database db = await openDB();
    final List<Map<String, dynamic>> userMap = await db.query('user', where: 'id = ?', whereArgs: [idUser]);

    return List.generate(
      userMap.length,
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

/// Query the database for all users with any fields especifics

Future<List<Map<String, dynamic>>> queryUsersView() async {
  final Database db = await openDB();

  String query = '''
    SELECT u.id, u.name, u.role
    FROM user u
  ''';

  final List<Map<String, dynamic>> result = await db.rawQuery(query);
  final Random random = Random();

  List<Map<String, dynamic>> updatedResult = result.map((item) {
    //todo: add random values the list users
    int tareasPendientes = random.nextInt(25) + 1;
    int leadsCreados = random.nextInt(15) + 1;
    String ventasganadas = "${random.nextInt(5) + 1} / ${random.nextInt(5000)} PEN";

    return {
      ...item,
      "tareaspendientes": tareasPendientes,
      "leadscreados": leadsCreados,
      "ventasganadas": ventasganadas,
    };
  }).toList();

  print('vista usuario: '+ query);
  return updatedResult;
}


/// Query the database for all users with any fields especifics

Future<List<Map<String, dynamic>>> queryUsersbyfilterName(String searchValue) async {
  final Database db = await openDB();

  String query = '''
    SELECT u.id, u.name, u.role
    FROM user u
    WHERE u.name LIKE '%$searchValue%'
  ''';

  final List<Map<String, dynamic>> result = await db.rawQuery(query);
  final Random random = Random();

  List<Map<String, dynamic>> updatedResult = result.map((item) {
    //todo: add random values the list users
    int tareasPendientes = random.nextInt(25) + 1;
    int leadsCreados = random.nextInt(15) + 1;
    String ventasganadas = "${random.nextInt(5) + 1} / ${random.nextInt(5000)} PEN";

    return {
      ...item,
      "tareaspendientes": tareasPendientes,
      "leadscreados": leadsCreados,
      "ventasganadas": ventasganadas,
    };
  }).toList();

  print('vista usuario: '+ query + ' , filas: '+result.length.toString());
  return updatedResult;
}

  insert(Map<String, dynamic> data) async {
    final Database db = await openDB();
    print('Se acaba de agregar un registro, ${db.rawQuery('SELECT * FROM user')}');
    return await db.insert('user', data);
  }

  //delete
  delete(int id) async {
    final Database db = await openDB();
    return await db.delete('user', where: 'id = ?', whereArgs: [id]);
  }

  //update
  update(Map<String, dynamic> data) async {
    final Database db = await openDB();
    return await db.update('user', data, where: 'id = ?', whereArgs: [data['id']]);
  }

  queryContacts() async {
    final Database db = await openDB();
    final List<Map<String, dynamic>> contactMap = await db.query("contact");

    return List.generate(
        contactMap.length,
        (i) => Contacts(
              id: contactMap[i]['id'],
              name: contactMap[i]['name'],
              role: contactMap[i]['role'],
              company: contactMap[i]['company'],
              phone: contactMap[i]['phone'],
              detail: contactMap[i]['detail'],
            ));
  }

  queryCompanies() async {
    final Database db = await openDB();
    final List<Map<String, dynamic>> companyMap = await db.query("company");

    return List.generate(
        companyMap.length,
        (i) => Companies(
              id: companyMap[i]['id'],
              companyName: companyMap[i]['company_name'],
              ruc: companyMap[i]['ruc'],
              location: companyMap[i]['location'],
              legalAddress: companyMap[i]['legal_address'],
              email: companyMap[i]['email'],
            ));
  }

  queryProjects() async {
    final Database db = await openDB();
    final List<Map<String, dynamic>> projectMap = await db.query("project");

    return List.generate(
        projectMap.length,
        (i) => Projects(
              id: projectMap[i]['id'],
              nameProject: projectMap[i]['nameProject'],
              companyName: projectMap[i]['companyName'],
              contactName: projectMap[i]['contactName'],
              startDate: projectMap[i]['startDate'],
              endDate: projectMap[i]['endDate'],
              projectManager: projectMap[i]['projectManager'],
              projectBudget: projectMap[i]['projectBudget'],
              projectValue: projectMap[i]['projectValue'],
            ));
  }


}

class Users {
  final int? id;
  final String? name;
  final String? dni;
  final String? tipo;
  final String? email;
  final String? password;
  final String? role;
  final String? phone;
  final String? address;

  Users(
      {this.id,
      this.name,
      this.dni,
      this.tipo,
      this.email,
      this.password,
      this.role,
      this.phone,
      this.address});

  Map<String, dynamic> toJson() {
    return {
      'Nro': id,
      'Nombre': name,
      'Dni': dni,
      'Tipo': tipo,
      'Correo': email,
      'Contraseña': password,
      'Cargo': role,
      'Telefono': phone,
      'Direccion': address
    };
  }
}

class Contacts {
  final int? id;
  final String? name;
  final String? role;
  final String? company;
  final String? phone;
  final String? detail;

  Contacts(
      {this.id, this.name, this.role, this.company, this.phone, this.detail});

  Map<String, dynamic> toJson() {
    return {
      'Nro': id,
      'Nombre': name,
      'Cargo': role,
      'Empresa': company,
      'Telefono': phone,
      'Detalle': detail
    };
  }
}

class Companies {
  final int? id;
  final String? companyName;
  final String? ruc;
  final String? location;
  final String? legalAddress;
  final String? email;
  final String? webSite;
  final DateTime? businessActivity;
  final DateTime? detail;
  final String? phone;

  Companies(
      {this.id,
      this.companyName,
      this.ruc,
      this.location,
      this.legalAddress,
      this.email,
      this.webSite,
      this.businessActivity,
      this.detail,
      this.phone});

  Map<String, dynamic> toJson() {
    return {
      'Nro': id,
      'Nombre': companyName,
      'Ruc': ruc,
      'Ubicacion': location,
      'Direccion Legal': legalAddress,
      'Correo': email,
      'Pagina Web': webSite,
      'Actividad Comercial': businessActivity,
      'Detalle': detail,
      'Telefono': phone
    };
  }
}

class Projects {
  final String? id;
  final String nameProject;
  final String companyName;
  final String contactName;
  final DateTime startDate;
  final DateTime endDate;
  final String projectManager;
  final double projectBudget;
  final double projectValue;

  Projects(
      {this.id,
      required this.nameProject,
      required this.companyName,
      required this.contactName,
      required this.startDate,
      required this.endDate,
      required this.projectManager,
      required this.projectBudget,
      required this.projectValue});

  Map<String, dynamic> toJson() {
    return {
      'Nro': id,
      'Nombre del Proyecto': nameProject,
      'Nombre de la Empresa': companyName,
      'Nombre del Contacto': contactName,
      'Fecha de Inicio': startDate,
      'Fecha de Finalizacion': endDate,
      'Gerente de Proyecto': projectManager,
      'Presupuesto del Proyecto': projectBudget,
      'Valor del Proyecto': projectValue
    };
  }
}
