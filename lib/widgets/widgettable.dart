import 'package:flutter/cupertino.dart';

class CTable extends StatelessWidget {
  List<String> nameKeys = [];
  final String moduleNombre;
  final List<dynamic> recordsList;
  final TableType tableType;
  late int lenHeader;
  //int lenHeader = recordsList[0].toJson().length;

  CTable({
    Key? key,
    required this.moduleNombre,
    required this.recordsList,
    this.tableType = TableType.users,
  }) : super(key: key) {
    lenHeader = recordsList.isNotEmpty ? recordsList[0].toJson().length : 0;
  }

  @override
  Widget build(BuildContext context) {
    //nameKeys = tableType.value;
    nameKeys.clear();
    if (recordsList.isNotEmpty) {
      nameKeys.addAll(recordsList[0].toJson().keys);
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
              children: List.generate(tableType.value.length, (index) {
                return Expanded(
                  flex: index == 0 ? 1 : index == 1 ? 3 : index == 2 ? 3 : index == 3 ? 1 : index == 4 ? 1 : 1,
                  child: Text(
                    //headers the tables
                    //nameKeys[index],
                    tableType.value[index],
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
                        for (var column = 0; column < lenHeader; column++)
                          Expanded(
                            child: Text(
                              recordsList[0]
                                  .toJson()
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
  contacts(value: [
    'Nro',
    'Nombre',
    'DNI',
    'Cargo',
  ]),
  companies(value: [
    'Nro',
    'Nombre',
    'RUC',
    'Telefono',
    'Direccion',
  ]),
  users(value: [
    'N°',
    'Asesor',
    'Cargo',
    'Tareas pendientes',
    'Leads  creados',
    'Ventas Ganadas',
    'Detalle'
  ]);

  const TableType({required this.value});
  final List<String> value;
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
