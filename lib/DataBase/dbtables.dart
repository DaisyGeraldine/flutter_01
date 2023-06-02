class DbTable{
  static const String dbTableUsers = 'user';
  static const String dbTableContacts = 'contact';
  static const String dbTableCompanies = 'company';
  static const String dbTableProjects = 'project';


  static const tables = [ 
    '''CREATE TABLE IF NOT EXISTS $dbTableUsers(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        dni TEXT,
        tipo TEXT,
        email TEXT,
        password TEXT,
        role TEXT,
        phone TEXT,
        address TEXT
    )'''
    ,
    '''CREATE TABLE IF NOT EXISTS $dbTableContacts(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        role TEXT,
        company TEXT,
        phone TEXT,
        detail TEXT
    )'''
    ,
    '''CREATE TABLE IF NOT EXISTS $dbTableCompanies(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        company_name TEXT,
        ruc TEXT,
        location TEXT,
        legal_address TEXT,
        email TEXT,
        web_site TEXT,
        business_activity TEXT,
        phone TEXT,
        detail TEXT
    )'''
    ,
    '''CREATE TABLE IF NOT EXISTS $dbTableProjects(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name_project TEXT,
        company_name TEXT,
        contact_name TEXT,
        start_date DATE,
        end_date DATE,
        project_manager TEXT, 
        project_budget DOUBLE,
        project_value DOUBLE
    )'''

    
  ];
}