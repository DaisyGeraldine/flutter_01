import 'package:drawer_views_project/DataBase/db.dart';
import 'package:flutter/cupertino.dart';

class AddProject extends StatefulWidget {
  const AddProject({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AddProject createState() => _AddProject();
}

class _AddProject extends State < AddProject >{

  final nameAsesor = TextEditingController();
  final dniAsesor = TextEditingController();
  final tipoAsesor = TextEditingController();
  final emailAsesor = TextEditingController();
  final passwordAsesor = TextEditingController();
  final roleAsesor = TextEditingController();
  final phoneAsesor = TextEditingController();
  final addressAsesor = TextEditingController();
  DBase dbase = DBase();

  @override
  Widget build(BuildContext context){
    
     return const CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Agregar Proyecto'),
        backgroundColor:Color(0x00ffffff),
      ), 
      child: Center(
        child: Text('Agregar Proyecto'),
      ),
    );
  }
}