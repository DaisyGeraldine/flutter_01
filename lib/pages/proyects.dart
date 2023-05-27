import 'package:flutter/cupertino.dart';

class ProyectsPage extends StatefulWidget {
  const ProyectsPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ProyectsPage createState() => _ProyectsPage();
}

class _ProyectsPage extends State < ProyectsPage >{
  
  @override
  Widget build(BuildContext context){
     return const CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Proyectos'),
        backgroundColor:Color(0x00ffffff),
      ), 
      child: Center(
        child: Text('Contenido Proyectos'),
      ),
    );
  }
}