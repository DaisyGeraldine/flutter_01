class DbTable{
  static const String dbTableUsers = 'user';
  static const String dbTableContacts = 'contact';
  static const String dbTableCompanies = 'company';
  static const String dbTableProjects = 'project';


  static const tables = [ 
    '''CREATE TABLE IF NOT EXISTS $dbTableUsers(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        dni TEXT NOT NULL,
        tipo TEXT,
        email TEXT,
        password TEXT NOT NULL,
        role TEXT,
        phone TEXT,
        address TEXT
    )'''
    ,
    '''CREATE TABLE IF NOT EXISTS $dbTableContacts(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        lastname TEXT NOT NULL,
        email TEXT NOT NULL,
        role TEXT NOT NULL,
        phone TEXT,
        hobbies TEXT,
        birthday DATE,
        company_id INTEGER NOT NULL,
        FOREIGN KEY (company_id) REFERENCES company(id)
    )'''
    ,
    '''CREATE TABLE IF NOT EXISTS $dbTableCompanies(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        company_name TEXT NOT NULL,
        ruc INTEGER NOT NULL,
        legal_address TEXT NOT NULL,
        email TEXT DEFAULT '',
        web_site TEXT DEFAULT '',
        business_activity TEXT DEFAULT '',
        phone INTEGER DEFAULT ''
    )'''
    ,
    '''CREATE TABLE IF NOT EXISTS $dbTableProjects(
        id_project INTEGER PRIMARY KEY AUTOINCREMENT,
        name_project TEXT NOT NULL,
        company_id INTEGER NOT NULL,
        contact_id INTEGER NOT NULL,
        start_date DATE,
        end_date DATE,
        project_manager TEXT, 
        project_budget DOUBLE,
        project_value DOUBLE,
        FOREIGN KEY (company_id) REFERENCES company(id),
        FOREIGN KEY (contact_id) REFERENCES contact(id)
    )'''

    
  ];
}