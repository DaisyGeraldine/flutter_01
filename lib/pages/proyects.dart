import 'package:drawer_views_project/DataBase/db.dart';
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

  DBase dbase = DBase();
  List<Map<String, dynamic>> projectsL = [];

  @override
  void initState() {
    _loadProjects();
    super.initState();
  }

  _loadProjects() async {
    List<Map<String, dynamic>> auxProjects = await dbase.queryProjects();

    setState(() {
      projectsL = auxProjects;
      }
    );
  }
  
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
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              const CSearchTextField(moduleNombre: 'Proyecto'),
              const SizedBox(height: 25,),
              //CTable(moduleNombre: 'Proyecto', recordsList: projectsL, tableType: TableType.projects,),
              const SizedBox(height: 25,),
              const CButtonSearch(moduleNombre: 'Proyecto')
            ],
          ),
        ),
      ),
    );
  }
}