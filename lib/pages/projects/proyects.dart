import 'dart:math';
import 'package:drawer_views_project/DataBase/db.dart';
import 'package:drawer_views_project/widgets/widgetsearchtextfield.dart';
import 'package:drawer_views_project/widgets/widgettable.dart';
import 'package:flutter/cupertino.dart';
class ProjectsPage extends StatefulWidget {
  const ProjectsPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ProjectsPage createState() => _ProjectsPage();
}

class _ProjectsPage extends State < ProjectsPage >{

  DBase dbase = DBase();
  List<Map<String, dynamic>> allProjects = [];
  int currentPage = 1;

  @override
  void initState() {
    _loadProjects();
    super.initState();
  }

  _loadProjects() async {
    List<Map<String, dynamic>> auxProjects = await dbase.queryProjectsView();
    allProjects = auxProjects;
    setState(() {});
  }

  List<Map<String, dynamic>> get projectsL {
    int startIndex = (currentPage - 1) * 6;
    int endIndex = min(startIndex + 6, allProjects.length);
    return allProjects.sublist(startIndex, endIndex);
  }

  int get elementCounter {
    return allProjects.length;
  }

  int get maxPages {
    return (elementCounter / 6).ceil();
  }
  
  @override
  Widget build(BuildContext context){
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Proyectos', 
          style: TextStyle(
            color: CupertinoColors.white, 
            fontSize: 20, 
            fontWeight: FontWeight.bold)),
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
              CSearchTextField(
                moduleNombre: 'Proyectos',
                onChanged: (value) {
                  onChangegSearch(value);
                },
              ),
              const SizedBox(
                height: 25,
              ),
              Expanded(
                child: CTable(
                  moduleNombre: 'Proyectos', 
                  recordsList: projectsL, 
                  tableType: TableType.projects, 
                  nextPageCallback: onTapNextPage,
                  previousPageCallback: () {
                    currentPage--;
                    currentPage = currentPage.clamp(1, maxPages);
                    setState(() {});
                  },
                  deleteCallback: (id) {
                    dbase.delete('project',id);
                    _loadProjects();
                  },
                  itemsPerPage: currentPage,
                ),
              ),
              const SizedBox(height: 25,),
            ],
          ),
        ),
      ),
    );
  }

  void onTapNextPage() {
    currentPage++;
    currentPage = currentPage.clamp(1, maxPages);
    setState(() {});
  }

  void onChangegSearch(String value) async {
    print('projects.dart:' + value);

    currentPage = 1;
    List<Map<String, dynamic>> results = await dbase.queryProjectsbyName(value);
    allProjects = results;
    setState(() {});
  }

  void onSucessNewProject() {
    print('Nuevo projecto creado');
    _loadProjects();
  }

}