import 'package:flutter/cupertino.dart';
import 'package:drawer_views_project/DataBase/db.dart';
class CSearchTextField extends StatelessWidget {
  const CSearchTextField({super.key, required this.moduleNombre});
  final String moduleNombre;
  

  @override
  Widget build(BuildContext context) {
    DBase dbase = DBase();
    final textController = TextEditingController();
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        padding: const EdgeInsets.all(0),
        width: 400,
        //color: CupertinoColors.systemPurple,
        child: Column(
          children: <Widget>[
            CupertinoSearchTextField(
              //backgroundColor: CupertinoColors.white,
              placeholder: 'Buscar $moduleNombre',
              controller: textController,
              onChanged: (value) {
                print(value);
                print('controller' + textController.text);
                dbase.queryUsersbyfilterName(textController.text);
              },
            )
          ],
        )
      ),
    );
  }
}