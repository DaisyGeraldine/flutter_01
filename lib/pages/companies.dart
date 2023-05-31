import 'package:flutter/cupertino.dart';

import '../widgets/template1.dart';

class CompaniesPage extends StatefulWidget {
  const CompaniesPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CompaniesPage createState() => _CompaniesPage();
}

class _CompaniesPage extends State < CompaniesPage >{
  
  @override
  Widget build(BuildContext context){
     /*return const CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Empresas'),
        backgroundColor:Color(0x00ffffff),
      ), 
      child: Center(
        child: Text('Contenido Empresas'),
      ),
    );*/
    return template1('Empresas');
  }
}