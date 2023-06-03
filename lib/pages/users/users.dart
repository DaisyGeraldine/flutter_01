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
  List<Users> usersL = [];

  @override
  void initState() {
    _loadUsers();
    super.initState();
  }

  _loadUsers() async {
    List<Users> auxUsers = await dbase.queryUsers();

    setState(() {
      usersL = auxUsers;
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
              const CSearchTextField(moduleNombre: 'Usuarios'),
              const SizedBox(
                height: 25,
              ),
              Expanded(
                child: CTable(moduleNombre: 'Usuarios', recordsList: usersL),
              ),
              const SizedBox(
                height: 25,
              ),
              const CButtonSearch(moduleNombre: 'Usuario')
            ],
          ),
        ),
      ),
    );
  }
}
