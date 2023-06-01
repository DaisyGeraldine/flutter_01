import 'package:drawer_views_project/widgets/widgetbuttonAdd.dart';
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
      child: const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(30.0),
          child: Column(
            children: [
              CSearchTextField(moduleNombre: 'Contacto'),
              SizedBox(height: 25,),
              //CTable(moduleNombre: 'Contacto', recordsList: [],)
            ],
          ),
        ),
      ),
    );
  }
}