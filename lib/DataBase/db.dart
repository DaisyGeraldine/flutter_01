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

  Future<List<Map<String, dynamic>>> queryCompanyDetailById(int idCompany) async {
    final Database db = await openDB();
    String query = '''
      SELECT c.id, c.company_name, c.ruc, c.legal_address, c.email, c.web_site, c.business_activity, c.phone,
      co.id as id_contact, co.name as name_contact, co.role as role_contact, co.phone as phone_contact
      FROM company c
      LEFT JOIN contact co ON co.company_id = c.id
      WHERE c.id = $idCompany
    ''';


    final List<Map<String, dynamic>> companyMap = await db.rawQuery(query);
    print(companyMap);

    return companyMap  ;
  }

  Future<List<Map<String, dynamic>>> queryContactById(int idContact) async {
    final Database db = await openDB();
    String query = '''
      SELECT co.id, co.name, co.lastname, co.email, co.role, co.phone, co.hobbies, co.birthday
      FROM contact co
      WHERE co.id = $idContact
    ''';


    final List<Map<String, dynamic>> contactMap = await db.rawQuery(query);
    print(contactMap);

    return contactMap  ;
  }

  // ----------------------------------------------------------------

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

    print('vista usuario: '+ result.toString());
    return updatedResult;
  }

  Future<List<Map<String, dynamic>>> queryCompaniesView() async {
    final Database db = await openDB();

    String query = '''
      SELECT c.id, c.company_name, c.ruc, c.legal_address
      FROM company c
    ''';

    final List<Map<String, dynamic>> result = await db.rawQuery(query);

    print('vista company: '+ result.toString());

    return result;
  }

  Future<List<Map<String, dynamic>>> queryContactsView() async {
    final Database db = await openDB();

    String query = '''
      SELECT co.id, co.name || ' ' || co.lastname AS nombreapellido, co.role, c.company_name, co.phone
      FROM contact co inner join company c on co.company_id = c.id
    ''';

    final List<Map<String, dynamic>> result = await db.rawQuery(query);

    print('vista contact: '+ result.toString());

    return result;
  }

  Future<List<Map<String, dynamic>>> queryProjectsView() async {
    final Database db = await openDB();

    String query = '''
      SELECT p.id_project, p.name_project, p.project_manager, p.project_budget, p.project_value
      FROM project p
    ''';

    final List<Map<String, dynamic>> result = await db.rawQuery(query);

    print('vista project: '+ result.toString());

    return result;
  }

  /// Query the database for all users with any fields especifics

  Future<List<Map<String, dynamic>>> queryUsersbyName(String searchValue) async {
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

  /// Query the database for all companies with any fields especifics

  Future<List<Map<String, dynamic>>> queryCompaniesbyName(String searchValue) async {
    final Database db = await openDB();

    String query = '''
      SELECT c.id, c.company_name, c.ruc, c.legal_address
      FROM company c
      WHERE c.company_name LIKE '%$searchValue%'
    ''';

    final List<Map<String, dynamic>> result = await db.rawQuery(query);

    print('vista usuario: '+ query + ' , filas: '+result.length.toString());

    return result;
  }

  Future<List<Map<String, dynamic>>> queryContactsbyName(String searchValue) async {
    final Database db = await openDB();

    String query = '''
      SELECT co.id, co.name, co.role, co.lastname, co.phone
      FROM contact co
      WHERE co.name LIKE '%$searchValue%'
    ''';

    final List<Map<String, dynamic>> result = await db.rawQuery(query);

    print('vista contact: '+ result.toString());

    return result;
  }

  Future<List<Map<String, dynamic>>> queryProjectsbyName(String searchValue) async {
    final Database db = await openDB();

    String query = '''
      SELECT p.id_project, p.name_project, p.project_manager, p.project_budget, p.project_value
      FROM project p
      WHERE p.name_project LIKE '%$searchValue%'
    ''';

    final List<Map<String, dynamic>> result = await db.rawQuery(query);

    print('vista project: '+ result.toString());

    return result;
  }

  //  insert row
  insert(String table, Map<String, dynamic> data) async {
    final Database db = await openDB();
    print('Se acaba de agregar un registro, ${db.rawQuery('SELECT * FROM $table')}');
    return await db.insert(table, data);
  }

  //delete row
  delete(String table,int id) async {
    final Database db = await openDB();
    return await db.delete(table, where: 'id = ?', whereArgs: [id]);
  }

  deleteCompany(String table,int id) async {
    final Database db = await openDB();
    
    // Eliminar los registros asociados en la tabla "contact"
    await db.delete('contact', where: 'company_id = ?', whereArgs: [id]);
    
    // Eliminar el registro de la tabla "company"
    return await db.delete(table, where: 'id = ?', whereArgs: [id]);
  }

  //update row
  update(String table, Map<String, dynamic> data) async {
    final Database db = await openDB();
    return await db.update(table, data, where: 'id = ?', whereArgs: [data['id']]);
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
    print('tabla companies: '+ companyMap.toString());
    return companyMap;
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

  existRuc(String value) async{
    final Database db = await openDB();
    final List<Map<String, dynamic>> companyMap = await db.query("company");
    bool exist = false;
    for (var i = 0; i < companyMap.length; i++) {
      print(companyMap[i]['ruc']);
      if (companyMap[i]['ruc'].toString() == value){
        print(companyMap[i]['ruc']);
        exist = true;
      }
    }
    print(exist);
    return exist;
  }

    existDni(String value) async{
    final Database db = await openDB();
    final List<Map<String, dynamic>> userMap = await db.query("user");
    bool exist = false;
    for (var i = 0; i < userMap.length; i++) {
      print(userMap[i]['dni']);
      if (userMap[i]['dni'].toString() == value){
        print(userMap[i]['dni']);
        exist = true;
      }
    }
    print(exist);
    return exist;
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
