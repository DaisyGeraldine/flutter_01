import 'package:drawer_views_project/DataBase/db.dart';
import 'package:flutter/cupertino.dart';

class CTable extends StatelessWidget {
  List<String> nameKeys = [];

  CTable({super.key, required this.moduleNombre, required this.recordsList});
  final String moduleNombre;
  final List<Users> recordsList;
  //var List<String> nameKeys = [];

  nameKeysList(){
    for (var i = 0; i < recordsList.length; i++) {
      nameKeys.addAll(recordsList[i].toJson().keys.toList());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
              for (var i = 0; i < recordsList.length; i++)
                //nameKeys.addAll(recordsList[i].toJson().keys.toList());
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,                      
                    children: [
                      for (var i = 0; i < recordsList.length; i++)
                      
                      //Text(nameKeys[i].toString(), style: const TextStyle(fontSize: 15, color: CupertinoColors.black, fontStyle: FontStyle.normal, fontWeight: FontWeight.normal),),
                      Text(recordsList[i].name.toString(), style: const TextStyle(fontSize: 15, color: CupertinoColors.black, fontStyle: FontStyle.normal, fontWeight: FontWeight.normal),),
                      Text(recordsList[i].tipo.toString(), style: const TextStyle(fontSize: 15, color: CupertinoColors.black, fontStyle: FontStyle.normal, fontWeight: FontWeight.normal),),
                      Text(recordsList[i].email.toString(), style: const TextStyle(fontSize: 15, color: CupertinoColors.black, fontStyle: FontStyle.normal, fontWeight: FontWeight.normal),),
                      Text(recordsList[i].password.toString(), style: const TextStyle(fontSize: 15, color: CupertinoColors.black, fontStyle: FontStyle.normal, fontWeight: FontWeight.normal),),
                    ],
                  ),
                ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  padding: const EdgeInsets.all(0),
                  width: 150,
                  //color: CupertinoColors.systemPurple,
                  child: Row(
                    children: <Widget>[
                      CupertinoButton(
                        onPressed: (){},
                        child: const Icon(CupertinoIcons.left_chevron, color: CupertinoColors.black, size: 30),
                      ),
                      const Text('01', style: TextStyle(fontSize: 15, color: CupertinoColors.black, fontWeight: FontWeight.normal, backgroundColor: CupertinoColors.systemBlue,)),
                      CupertinoButton(
                        onPressed: (){},
                        child: const Icon(CupertinoIcons.right_chevron, color: CupertinoColors.black, size: 30),
                      ),
                    ],
                  )
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

/*class ContactsColumns {
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
];*/
