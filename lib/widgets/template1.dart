/*import 'package:flutter/material.dart';

class Template1 extends StatelessWidget {
  const Template1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text('template1'),
    );
  }
}*/


//import 'package:drawer_views_project/DataBase/db.dart';
import 'package:drawer_views_project/pages/adduser.dart';
import 'package:flutter/cupertino.dart';

class Template1 extends StatelessWidget {
  const Template1({super.key, required this.moduleNombre});
  final String moduleNombre;
  //DBase dbase = DBase();

  /*loadUsers() async {
    List<DBase> auxUsers = await dbase.query();

    setState(() {
      animales = auxUsers;
    });

  }*/

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(moduleNombre, style: const TextStyle(color: CupertinoColors.white, fontSize: 20, fontWeight: FontWeight.bold)),
        backgroundColor: const Color.fromARGB(174, 7, 18, 230),
        trailing: const Icon(CupertinoIcons.person, color: CupertinoColors.white, size: 30),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      padding: const EdgeInsets.all(0),
                      width: 500,
                      //color: CupertinoColors.systemPurple,
                      child: const Column(
                        children: <Widget>[
                          CupertinoSearchTextField(
                            //backgroundColor: CupertinoColors.white,
                            placeholder: 'Buscar Contacto',)
                        ],
                      )
                    ),
              ),
              const SizedBox(height: 25,),
              Column(
                children: [
                  Container(
                    //margin: const EdgeInsets.only(top: 10),
                    padding: const EdgeInsets.all(10),
                    //color: CupertinoColors.systemGrey4,
                    decoration: const BoxDecoration(
                      color: CupertinoColors.systemGrey4,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      border: Border.fromBorderSide(BorderSide(color: CupertinoColors.systemGrey4, width: 1, style: BorderStyle.solid))
                    ),
                    child: const Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Nro', style: TextStyle(fontSize: 15, color: CupertinoColors.black, fontFamily: 'Arial', fontWeight: FontWeight.bold)),
                          Text('Nombre', style: TextStyle(fontSize: 15, color: CupertinoColors.black, fontFamily: 'Arial', fontWeight: FontWeight.bold)),
                          Text('Cargo', style: TextStyle(fontSize: 15, color: CupertinoColors.black, fontFamily: 'Arial', fontWeight: FontWeight.bold)),
                          Text('Empresa', style: TextStyle(fontSize: 15, color: CupertinoColors.black, fontFamily: 'Arial', fontWeight: FontWeight.bold)),
                          Text('Telefono', style: TextStyle(fontSize: 15, color: CupertinoColors.black, fontFamily: 'Arial', fontWeight: FontWeight.bold)),
                          Text('Detalle', style: TextStyle(fontSize: 15, color: CupertinoColors.black, fontFamily: 'Arial', fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 25,),
                  Container(
                    padding: const EdgeInsets.all(10),
                    //color: CupertinoColors.systemGrey4,
                    decoration: const BoxDecoration(
                      //color: CupertinoColors.systemGrey4,
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                      border: Border.fromBorderSide(BorderSide(color: CupertinoColors.systemGrey4, width: 1, style: BorderStyle.solid))
                    ),
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        for (var i = 0; i < _contactsList.length; i++)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,                      
                              children: [
                                    Text(_contactsList[i].nro.toString(), style: const TextStyle(fontSize: 15, color: CupertinoColors.black, fontStyle: FontStyle.normal, fontWeight: FontWeight.bold),),
                                    Text(_contactsList[i].nombre, style: const TextStyle(fontSize: 15, color: CupertinoColors.black, fontStyle: FontStyle.normal, fontWeight: FontWeight.normal)),
                                    Text(_contactsList[i].cargo, style: const TextStyle(fontSize: 15, color: CupertinoColors.black, fontStyle: FontStyle.normal, fontWeight: FontWeight.normal)),
                                    Text(_contactsList[i].empresa, style: const TextStyle(fontSize: 15, color: CupertinoColors.black, fontStyle: FontStyle.normal, fontWeight: FontWeight.normal)),
                                    Text(_contactsList[i].telefono, style: const TextStyle(fontSize: 15, color: CupertinoColors.black, fontStyle: FontStyle.normal, fontWeight: FontWeight.normal)),
                                    Text(_contactsList[i].detalle, style: const TextStyle(fontSize: 15, color: CupertinoColors.black, fontStyle: FontStyle.normal, fontWeight: FontWeight.normal)),
                              ],
                            ),
                          ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            padding: const EdgeInsets.all(0),
                            width: 150,
                            //color: CupertinoColors.systemPurple,
                            child: const Row(
                              children: <Widget>[
                                CupertinoButton(
                                  onPressed: null,
                                  child: Icon(CupertinoIcons.left_chevron, color: CupertinoColors.black, size: 30),
                                ),
                                Text('01', style: TextStyle(fontSize: 15, color: CupertinoColors.black, fontWeight: FontWeight.normal, backgroundColor: CupertinoColors.systemBlue,)),
                                CupertinoButton(
                                  onPressed: null,
                                  child: Icon(CupertinoIcons.right_chevron, color: CupertinoColors.black, size: 30),
                                ),
                              ],
                            )
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50,),
              Align(
                alignment: Alignment.topRight,
                child: CupertinoButton.filled(
                  
                  child: Text(moduleNombre), 
                  onPressed: (){
                    Navigator.push(
                      context,
                      CupertinoPageRoute(builder: (context) => const AddUser()),
                    );
                  },    
                ), 
                /*Container(
                  padding: const EdgeInsets.all(15),
                  width: 150,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(251, 11, 78, 248),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    border: Border.fromBorderSide(BorderSide(color: Color.fromARGB(251, 11, 78, 248), width: 2, style: BorderStyle.solid))
                  ),
                  child: Row(
                    children: [
                      const Icon(CupertinoIcons.add, color: CupertinoColors.white, size: 30),
                      Text(moduleNombre, style: const TextStyle(fontSize: 15, color: CupertinoColors.white, fontFamily: 'Arial', fontWeight: FontWeight.bold)),
                    ],  
                  ),
                ),*/
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ContactsColumns {
  final int nro;
  final String nombre;
  final String cargo;
  final String empresa;
  final String telefono;
  final String detalle;

  ContactsColumns(this.nro, this.nombre, this.cargo, this.empresa, this.telefono, this.detalle);
}

final List<ContactsColumns> _contactsList = [
  ContactsColumns(1, "Julian Vargas Espinoza", "Ejecutivo de ventas", "Nombre de empresa 01", "+51 999 888 777", "icon"),
  ContactsColumns(2, "Adrian Lopez Benavidez", "Key Account Manager", "Nombre de empresa 01", "+51 999 888 777", "icon"),
  ContactsColumns(3, "Gonzalo Vargas Espinoza", "Gerente Comercial", "Nombre de empresa 01", "+51 999 888 777", "icon"),
  ContactsColumns(4, "Lucia Rosales Espinoza", "Gerente General", "Nombre de empresa 01", "+51 999 888 777", "icon"),
  ContactsColumns(5, "Maria Vargas Sanchez", "Asistente Marketing", "Nombre de empresa 01", "+51 999 888 777", "icon"),
  ContactsColumns(6, "Victor Vargas Ramirez", "Cargo X", "Nombre de empresa 01", "+51 999 888 777", "icon")
];
