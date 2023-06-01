class DbTable{
  static const String dbTableUsers = 'user';
  static const String dbTableContacts = 'contact';
  static const String dbTableProyects = 'proyect';
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
    
  ];
}