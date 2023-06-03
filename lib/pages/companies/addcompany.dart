import 'package:drawer_views_project/DataBase/db.dart';
import 'package:flutter/cupertino.dart';

class AddCompany extends StatefulWidget {
  const AddCompany({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AddCompany createState() => _AddCompany();
}

class _AddCompany extends State < AddCompany >{

  //final nameAsesor = TextEditingController();

  DBase dbase = DBase();

  @override
  Widget build(BuildContext context){
    
     return CupertinoPageScaffold(
              navigationBar: const CupertinoNavigationBar(
              middle: Text('Añadir Empresa'),
              backgroundColor:Color.fromARGB(21, 36, 35, 35),
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          CupertinoTextFormFieldRow(decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: CupertinoColors.systemGrey, width: 0.3),),), placeholder: 'Razon Social', controller: null,),                     
                          CupertinoTextFormFieldRow(decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: CupertinoColors.systemGrey, width: 0.3),),), placeholder: 'Ruc', controller: null,),    
                          CupertinoTextFormFieldRow(decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: CupertinoColors.systemGrey, width: 0.3),),), placeholder: 'Direccion Legal', controller: null,),
                        ],
                      ),                  
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Row(
                          children: [
                            CupertinoButton(
                              child: const Text('Cancelar'),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            CupertinoButton.filled(
                              child: const Text('Crear'),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
  }
}