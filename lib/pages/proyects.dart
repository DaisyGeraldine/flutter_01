import 'package:drawer_views_project/widgets/widgetbuttonadd.dart';
import 'package:drawer_views_project/widgets/widgetsearchtextfield.dart';
import 'package:drawer_views_project/widgets/widgettable.dart';
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
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Proyectos', style: TextStyle(color: CupertinoColors.white, fontSize: 20, fontWeight: FontWeight.bold)),
        backgroundColor: const Color.fromARGB(174, 7, 18, 230),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: (){},
          child: const Icon(CupertinoIcons.person),
        ),
      ),
      child: const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(30.0),
          child: Column(
            children: [
              CSearchTextField(moduleNombre: 'Proyecto'),
              SizedBox(height: 25,),
              //CTable(moduleNombre: 'Proyecto'),
              SizedBox(height: 25,),
              CButtonSearch(moduleNombre: 'Proyecto')
            ],
          ),
        ),
      ),
    );
  }
}