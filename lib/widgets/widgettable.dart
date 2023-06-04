import 'package:flutter/cupertino.dart';

class CTable extends StatelessWidget {
  List<String> nameKeys = [];
  final String moduleNombre;
  final List<Map<String, dynamic>> recordsList;
  final TableType tableType;
  late int lenHeader;
  //int lenHeader = recordsList[0].toJson().length;

  CTable({
    Key? key,
    required this.moduleNombre,
    required this.recordsList,
    required this.tableType,
  }) : super(key: key) {
    lenHeader = recordsList.isNotEmpty ? recordsList[0].length : 0;
  }

  @override
  Widget build(BuildContext context) {
    //nameKeys = tableType.value;
    nameKeys.clear();
    if (recordsList.isNotEmpty) {
      nameKeys.addAll(recordsList[0].keys);
    }
    return Column(
      children: [
        Container(
          //margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.all(10),
          //color: CupertinoColors.systemGrey4,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(255, 143,143,143).withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 1,
                offset: const Offset(0, 1), // changes position of shadow
              ),
            ],
            //color: const Color.fromARGB(255, 143,143,143).withOpacity(0.2),
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            border: Border.fromBorderSide(
              BorderSide(
                color: const Color.fromARGB(255, 143,143,143).withOpacity(0.2),
                width: 1,
                style: BorderStyle.solid,
              ),
            ),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              /*children: List.generate(lenHeader, (index) {
                return Expanded(
                  flex: 2,
                  child: Text(
                    //headers the tables
                    //nameKeys[index],
                    //here we are using the enum
                    tableType.value[index],
                    style: const TextStyle(
                        fontSize: 15,
                        color: CupertinoColors.black,
                        fontFamily: 'Arial',
                        fontWeight: FontWeight.bold),
                  ),
                );
              }),*/
              //here use the enum
              children: List.generate(tableType.valueMap.length, (index) {
                print(tableType.valueMap.length);
                return Expanded(
                  flex: tableType.valueMap.values.toList()[index],
                  child: Text(
                    //headers the tables
                    //nameKeys[index],
                    tableType.valueMap.keys.toList()[index].toString(),
                    style: const TextStyle(
                        fontSize: 15,
                        color: CupertinoColors.black,
                        fontFamily: 'Arial',
                        fontWeight: FontWeight.bold),
                  ),
                );
              }),
            ),
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(10),
            //color: CupertinoColors.systemGrey4,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(255, 143,143,143).withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: const Offset(0, 1), // changes position of shadow
                ),
              ],
              color: const Color.fromARGB(255, 255, 255, 255),
              borderRadius: const BorderRadius.all(Radius.circular(2)),
              border: const Border.fromBorderSide(BorderSide(
                    color: Color.fromARGB(255, 199,195,202),
                    width: 1,
                    style: BorderStyle.solid))),
              child: ListView(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                for (var row = 0; row < 50; row++)
                  //nameKeys.addAll(recordsList[i].toJson().keys.toList());
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        for (var column = 0; column < (lenHeader + 1); column++)
                          Expanded(
                            flex: tableType.valueMap.values.toList()[column],
                            child: column == lenHeader
                            ?
                            //want to add a button with border circular
                            
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CupertinoButton(
                                  padding: const EdgeInsets.all(0),
                                  minSize: 0,
                                  onPressed: () {},
                                  borderRadius: const BorderRadius.all(Radius.circular(100)),
                                  color: Color.fromARGB(255, 215, 201, 201),
                                  child: const Icon(CupertinoIcons.pencil,
                                    color: Color.fromARGB(255,37,78,90), size: 20),
                                ),
                                CupertinoButton(
                                  padding: const EdgeInsets.all(0),
                                  minSize: 0,
                                  onPressed: () {},
                                  borderRadius: const BorderRadius.all(Radius.circular(100)),
                                  color: Color.fromARGB(255, 215, 201, 201),
                                  child: const Icon(CupertinoIcons.delete,
                                    color: Color.fromARGB(255, 126,16,8), size: 20),
                                ),
                                CupertinoButton(
                                  padding: const EdgeInsets.all(0),
                                  minSize: 0,
                                  onPressed: () {},
                                  borderRadius: const BorderRadius.all(Radius.circular(100)),
                                  color: Color.fromARGB(255, 215, 201, 201),
                                  child: const Icon(CupertinoIcons.exclamationmark_circle,
                                    color: Color.fromARGB(255,37,78,90), size: 20),
                                ),
                              ],
                            )
                                  /*child: CupertinoButton(
                                    padding: const EdgeInsets.all(0),
                                    minSize: 0,
                                      onPressed: () {},
                                      borderRadius: const BorderRadius.all(Radius.circular(100)),
                                      color: Color.fromARGB(255, 215, 201, 201),
                                      child: const Icon(CupertinoIcons.delete,
                                        color: Color.fromARGB(255, 126,16,8), size: 20),
                                    ),*/
                              
                            
                            : 
                              Text(
                                recordsList[0]
                                    .values
                                    .toList()[column]
                                    .toString(),
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: CupertinoColors.black,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.normal,
                                ),
                              
                              ),
                          ),
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
                            onPressed: () {},
                            child: const Icon(CupertinoIcons.left_chevron,
                                color: CupertinoColors.black, size: 30),
                          ),
                          const Text('01',
                              style: TextStyle(
                                fontSize: 15,
                                color: CupertinoColors.black,
                                fontWeight: FontWeight.normal,
                                backgroundColor: CupertinoColors.systemBlue,
                              )),
                          CupertinoButton(
                            onPressed: () {},
                            child: const Icon(CupertinoIcons.right_chevron,
                                color: CupertinoColors.black, size: 30),
                          ),
                        ],
                      )),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// Create enum for table types
enum TableType {
  contacts(valueMap: {
    'Nro' : 1,
    'Nombre': 2,
    'DNI' : 2,
    'Cargo' : 3,
  }),
  companies(valueMap: {  
    'Nro' : 1,
    'Nombre' : 2,
    'RUC' : 3,
    'Telefono' : 3,
    'Direccion' : 3,
  }),
  users(valueMap: {  
    'N°' : 1,
    'Asesor': 3,
    'Cargo' : 3,
    'Tareas pendientes' : 1,
    'Leads  creados' : 1,
    'Ventas Ganadas' : 1,
    'Detalle' : 2,
  }),
  projects(valueMap: {
    'N°': 1,
    'Proyecto' : 2,
    '%Avanzado' : 2,
    'Presupuesto' : 3,
    'Fecha de Cierre' : 3,
    'Detalle' : 3
  });

  const TableType({required this.valueMap});
  final Map<String, int> valueMap;
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
