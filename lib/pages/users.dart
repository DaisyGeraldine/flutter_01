import 'package:flutter/cupertino.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _UsersPage createState() => _UsersPage();
}

class _UsersPage extends State < UsersPage >{
  
  @override
  Widget build(BuildContext context){
     return const CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Usuarios'),
        backgroundColor:Color(0x00ffffff),
      ), 
      child: Center(
        child: Text('Contenido Usuarios'),
      ),
    );
  }
}