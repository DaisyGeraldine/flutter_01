import 'dart:math';
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
  List<Map<String, dynamic>> allContacts = [];
  int currentPage = 1;

  @override
  void initState() {
    _loadContacts();
    super.initState();
  }

  _loadContacts() async {
    List<Map<String, dynamic>> auxContacts = await dbase.queryContactsView();
    allContacts = auxContacts;
    setState(() {});
  }

  List<Map<String, dynamic>> get contactsL {
    int startIndex = (currentPage - 1) * 6;
    int endIndex = min(startIndex + 6, allContacts.length);
    return allContacts.sublist(startIndex, endIndex);
  }

  int get elementCounter {
    return allContacts.length;
  }

  int get maxPages {
    return (elementCounter / 6).ceil();
  }
  
  @override
  Widget build(BuildContext context){
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Contactos', 
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
                moduleNombre: 'Contactos',
                onChanged: (value) {
                  onChangegSearch(value);
                },
              ),
              const SizedBox(
                height: 25,
              ),
              Expanded(
                child: CTable(
                  moduleNombre: 'Contactos', 
                  recordsList: contactsL, 
                  tableType: TableType.contacts, 
                  nextPageCallback: onTapNextPage,
                  previousPageCallback: () {
                    currentPage--;
                    currentPage = currentPage.clamp(1, maxPages);
                    setState(() {});
                  },
                  deleteCallback: (id) {
                    dbase.delete('contact',id);
                    _loadContacts();
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
    print('contacts.dart:' + value);

    currentPage = 1;
    List<Map<String, dynamic>> results = await dbase.queryContactsbyName(value);
    allContacts = results;
    setState(() {});
  }

  void onSucessNewContact() {
    print('Nuevo contacto creado');
    _loadContacts();
  }

}