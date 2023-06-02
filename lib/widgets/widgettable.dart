import 'package:flutter/cupertino.dart';

class CTable extends StatelessWidget {
  List<String> nameKeys = [];
  final String moduleNombre;
  final List<dynamic> recordsList;
  late int lenHeader;
  //int lenHeader = recordsList[0].toJson().length;

  CTable({Key? key, required this.moduleNombre, required this.recordsList}): super(key: key){
    
  lenHeader = recordsList.isNotEmpty ? recordsList[0].toJson().length : 0;
  }

  List<Widget> nameKeysList(){
    List<Widget> widgetsHeader = [];
    //Error: The getter 'length' isn't defined for the type 'Map<String, dynamic>'.
    //lenHeader = recordsList[0].toJson().length;
    print(lenHeader);
    nameKeys.clear();
    nameKeys.addAll(recordsList[0].toJson().keys);
    for (var i = 0; i < lenHeader; i++) {
      print(nameKeys);
      widgetsHeader.add(Text(nameKeys[i], style: const TextStyle(fontSize: 15, color: CupertinoColors.black, fontFamily: 'Arial', fontWeight: FontWeight.bold)));
    }
    return widgetsHeader;
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
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [        
                  //nameKeys.addAll(recordsList[i].toJson().keys.toList());
                  //for (var i = 0; i < recordsList[0].toJson().length; i++)
                  for (var i = 0; i < lenHeader; i++)
                    nameKeysList()[i]
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
              for (var row = 0; row < recordsList.length; row++)
                //nameKeys.addAll(recordsList[i].toJson().keys.toList());
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,                      
                    children: [
                      for (var column = 0; column < lenHeader; column++)
                        Text(recordsList[row].toJson().values.toList()[column].toString(), style: const TextStyle(fontSize: 15, color: CupertinoColors.black, fontStyle: FontStyle.normal, fontWeight: FontWeight.normal),),
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
