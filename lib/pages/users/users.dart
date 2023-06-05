import 'dart:math';
import 'package:drawer_views_project/DataBase/db.dart';
import 'package:drawer_views_project/widgets/widgetbuttonadd.dart';
import 'package:drawer_views_project/widgets/widgetsearchtextfield.dart';
import 'package:drawer_views_project/widgets/widgettable.dart';
import 'package:flutter/cupertino.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _UsersPage createState() => _UsersPage();
}

class _UsersPage extends State<UsersPage> {
  DBase dbase = DBase();
  List<Map<String, dynamic>> usersL = [];
  //List<Map<String, dynamic>> newViewUsersL = [];
  int currentPage = 1;

  @override
  void initState() {
    _loadUsers();
    super.initState();
  }

  _loadUsers() async {
    List<Map<String, dynamic>> auxUsers = await dbase.queryUsersView();

    int startIndex = (currentPage - 1) * 6;
    int endIndex = min(startIndex + 6, auxUsers.length);
    int maxPage = (auxUsers.length~/6) + 1;

    setState(() {
      print('conteo : ' + maxPage.toString());
      //usersL = onNextPageCallback(auxUsers);
      if (maxPage >= currentPage && currentPage > 0) {
        usersL = auxUsers.sublist(startIndex, endIndex);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Usuarios',
            style: TextStyle(
                color: CupertinoColors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold
            )
        ),
        backgroundColor: const Color.fromARGB(255, 0,90,193),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {},
          child: const Icon(CupertinoIcons.person),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(
            children: [
              CSearchTextField(
                moduleNombre: 'Usuarios', 
                onChanged: (value) {
                  onChangegSearch(value);
                },
              ),
              const SizedBox(
                height: 25,
              ),
              Expanded(
                child: CTable(
                  moduleNombre: 'Usuarios', 
                  recordsList: usersL, 
                  tableType: TableType.users,
                  nextPageCallback: () {
                    setState(() {
                      currentPage++;
                      print('pag : ' + currentPage.toString());
                      _loadUsers();
                    });
                  },
                  previousPageCallback: () {
                    setState(() {
                      currentPage--;
                      print('pag : ' + currentPage.toString());
                      _loadUsers();
                    });
                  },
                  deleteCallback: (id) {
                    dbase.delete(id);
                    _loadUsers();
                  },
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const CButtonSearch(
                moduleNombre: 'Usuario')
            ],
          ),
        ),
      ),
    );
  }

  void onChangegSearch(String value) async {
    print('users.dart:' + value);

    currentPage = 1;
    List<Map<String, dynamic>> results = await dbase.queryUsersbyfilterName(value);
    int startIndex = (currentPage - 1) * 6;
    int endIndex = min(startIndex + 6, results.length);

    setState(() {
      //currentPage = 1;
      usersL = results.sublist(startIndex, endIndex);
      //usersL = onNextPageCallback(results);
    });
  }

  /*List<Map<String, dynamic>> onNextPageCallback(List<Map<String, dynamic>> newListFilter){
    int startIndex = (currentPage - 1) * 6;
    int endIndex = min(startIndex + 6, newListFilter.length);

    setState(() {
      newViewUsersL = newListFilter.sublist(startIndex, endIndex);
    });
    return newViewUsersL;
  }*/

}
