import 'package:drawer_views_project/DataBase/db.dart';
import 'package:drawer_views_project/widgets/widgetsearchtextfield.dart';
import 'package:drawer_views_project/widgets/widgettable.dart';
import 'package:flutter/cupertino.dart';
class ContactsPage extends StatefulWidget {
  const ContactsPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ContactsPage createState() => _ContactsPage();
}

class _ContactsPage extends State < ContactsPage >{

  DBase dbase = DBase();
  List<Map<String, dynamic>> contactsL = [];

  @override
  void initState() {
    _loadContacts();
    super.initState();
  }

  _loadContacts() async {
    List<Map<String, dynamic>> auxContacts = await dbase.queryContacts();

    setState(() {
      contactsL = auxContacts;
      }
    );
  }
  
  @override
  Widget build(BuildContext context){
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Contactos', style: TextStyle(color: CupertinoColors.white, fontSize: 20, fontWeight: FontWeight.bold)),
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
              const CSearchTextField(moduleNombre: 'Contacto'),
              const SizedBox(height: 25,),
              //CTable(moduleNombre: 'Contacto', recordsList: contactsL, tableType: TableType.contacts,)
            ],
          ),
        ),
      ),
    );
  }
}