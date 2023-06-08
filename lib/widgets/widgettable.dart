import 'package:drawer_views_project/pages/companies/viewcompany.dart';
import 'package:drawer_views_project/pages/users/viewuser.dart';
import 'package:flutter/cupertino.dart';

class CTable extends StatelessWidget {
  final String moduleNombre;
  final List<Map<String, dynamic>> recordsList;
  final TableType tableType;
  late int lenHeader;
  final Function nextPageCallback;
  final Function previousPageCallback;
  final Function deleteCallback;
  final int itemsPerPage;
  //int currentPage = 1;

  //int lenHeader = recordsList[0].toJson().length;

  CTable({
    Key? key,
    required this.moduleNombre,
    required this.recordsList,
    required this.tableType,
    required this.nextPageCallback,
    required this.previousPageCallback,
    required this.deleteCallback,
    this.itemsPerPage = 0,
    //this.itemsPerPage = 6,
  }) : super(key: key) {
    lenHeader = recordsList.isNotEmpty ? recordsList[0].length : 0;
  }

  @override
  Widget build(BuildContext context) {
    //nameKeys = tableType.value;
    //final startIndex = (currentPage - 1) * itemsPerPage;
    //final endIndex = min(startIndex + itemsPerPage, recordsList.length);
    /*if (recordsList.isNotEmpty) {
      nameKeys.addAll(recordsList[0].keys);
    }*/
    return
        // recordsList.isEmpty
        // ?
        // const CircularProgressIndicator(semanticsLabel: 'Cargando...',)
        // :
        Column(
      children: [
        Container(
          //margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.all(10),
          //color: CupertinoColors.systemGrey4,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color:
                    const Color.fromARGB(255, 143, 143, 143).withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 1,
                offset: const Offset(0, 1), // changes position of shadow
              ),
            ],
            //color: const Color.fromARGB(255, 143,143,143).withOpacity(0.2),
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            border: Border.fromBorderSide(
              BorderSide(
                color:
                    const Color.fromARGB(255, 143, 143, 143).withOpacity(0.2),
                width: 1,
                style: BorderStyle.solid,
              ),
            ),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(tableType.valueMap.length, (index) {
                print('nro de campos:' + tableType.valueMap.length.toString());
                print('widget table.dart :' + recordsList.length.toString());
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
                  color:
                      const Color.fromARGB(255, 143, 143, 143).withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: const Offset(0, 1), // changes position of shadow
                ),
              ],
              color: const Color.fromARGB(255, 255, 255, 255),
              borderRadius: const BorderRadius.all(Radius.circular(2)),
              border: const Border.fromBorderSide(
                BorderSide(
                    color: Color.fromARGB(255, 199, 195, 202),
                    width: 1,
                    style: BorderStyle.solid),
              ),
            ),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      for (var row = 0; row < recordsList.length; row++)
                        //nameKeys.addAll(recordsList[i].toJson().keys.toList());
                        Padding(
                          padding: const EdgeInsets.all(0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              for (var column = 0;
                                  column < (lenHeader + 1);
                                  column++)
                                Expanded(
                                  flex: tableType.valueMap.values
                                      .toList()[column],
                                  child: column == lenHeader
                                      ?
                                      //want to add a button with border circular

                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            CupertinoButton(
                                              minSize: 0,
                                              padding: const EdgeInsets.only(
                                                  left: 5, right: 5, top: 10, bottom: 10),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(100)),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: const Color.fromARGB(255, 255, 255, 255),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: const Color
                                                                    .fromARGB(
                                                                255,
                                                                143,
                                                                143,
                                                                143)
                                                            .withOpacity(0.3),
                                                        spreadRadius: 1,
                                                        blurRadius: 1,
                                                        offset: const Offset(0,
                                                            1), // changes position of shadow
                                                      ),
                                                    ]),
                                                padding:
                                                    const EdgeInsets.all(4.0),
                                                child: const Icon(
                                                  CupertinoIcons.pencil,
                                                  size: 16,
                                                  color: Color.fromARGB(
                                                      255, 7, 50, 100),
                                                ),
                                              ),
                                              onPressed: () {},
                                            ),
                                            CupertinoButton(
                                              minSize: 0,
                                              padding: const EdgeInsets.only(
                                                  left: 5, right: 5, top: 10, bottom: 10),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(100)),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: const Color.fromARGB(
                                                        255, 255, 255, 255),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: const Color
                                                                    .fromARGB(
                                                                255,
                                                                143,
                                                                143,
                                                                143)
                                                            .withOpacity(0.3),
                                                        spreadRadius: 1,
                                                        blurRadius: 1,
                                                        offset: const Offset(0,
                                                            1), // changes position of shadow
                                                      ),
                                                    ]),
                                                padding:
                                                    const EdgeInsets.all(4.0),
                                                child: const Icon(
                                                  CupertinoIcons.delete,
                                                  size: 16,
                                                  color: Color.fromARGB(
                                                      255, 126, 16, 8),
                                                ),
                                              ),
                                              onPressed: () {
                                                onPressedDelete(context, deleteCallback, recordsList[row]['id']);
                                              },
                                            ),
                                            CupertinoButton(
                                              padding: const EdgeInsets.only(
                                                  left: 5, right: 5, top: 10, bottom: 10),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(100)),
                                              minSize: 0,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: const Color.fromARGB(
                                                        255, 255, 255, 255),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: const Color
                                                                    .fromARGB(
                                                                255,
                                                                143,
                                                                143,
                                                                143)
                                                            .withOpacity(0.3),
                                                        spreadRadius: 1,
                                                        blurRadius: 1,
                                                        offset: const Offset(0,
                                                            1), // changes position of shadow
                                                      ),
                                                    ]),
                                                padding:
                                                    const EdgeInsets.all(4.0),
                                                child: const Icon(
                                                  CupertinoIcons
                                                      .exclamationmark,
                                                  size: 16,
                                                  color: Color.fromARGB(
                                                      255, 7, 50, 100),
                                                ),
                                              ),
                                              onPressed: () {
                                                onPressedRowDetail(
                                                    moduleNombre,
                                                    context,
                                                    recordsList[row]['id']);
                                              },
                                            ),
                                          ],
                                        )
                                      : 
                                      column == 0
                                        ? Text(
                                            (row + 1).toString(),
                                            style: const TextStyle(
                                              fontSize: 15,
                                              color: CupertinoColors.black,
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          )
                                        : Text(
                                            recordsList[row]
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
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                      padding: const EdgeInsets.all(2),
                      width: 150,
                      //color: CupertinoColors.systemPurple,
                      child: Row(
                        children: <Widget>[
                          CupertinoButton(
                            padding: const EdgeInsets.all(0),
                            onPressed: () {
                              previousPageCallback();
                            },
                            child: const Icon(CupertinoIcons.left_chevron,
                                color: CupertinoColors.black, size: 25),
                          ),
                          Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(0),
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      const Color.fromARGB(255, 143, 143, 143)
                                          .withOpacity(0.3),
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                  offset: const Offset(
                                      0, 2), // changes position of shadow
                                ),
                              ],
                              color: const Color.fromARGB(255, 0, 90, 193)
                                  .withOpacity(0.3),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8)),
                              border: const Border.fromBorderSide(
                                BorderSide(
                                    color: Color.fromARGB(255, 199, 195, 202),
                                    width: 1,
                                    style: BorderStyle.solid),
                              ),
                            ),
                            child: Text(
                              itemsPerPage.toString(),
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ),
                          CupertinoButton(
                            padding: const EdgeInsets.all(0),
                            onPressed: () {
                              nextPageCallback();
                            },
                            child: const Icon(CupertinoIcons.right_chevron,
                                color: CupertinoColors.black, size: 25),
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

onPressedDelete(BuildContext context, Function deleteCallback, int id) {
  BuildContext currentContext = context;
  //here show messagge with alert dialog cupertino
  showCupertinoDialog(
    context: currentContext,
    builder: (currentContext) =>
        CupertinoAlertDialog(
      title: const Text(
          'Eliminar registro'),
      content: const Text(
          '¿Está seguro de eliminar este registro?'),
      actions: [
        CupertinoDialogAction(
          child: const Text(
              'Cancelar'),
          onPressed: () {
            Navigator.pop(
                currentContext);
          },
        ),
        CupertinoDialogAction(
          child: const Text(
              'Eliminar'),
          onPressed: () {
            deleteCallback(id);
            Navigator.pop(
                      context);
          },
        ),
      ],
    ),
  );
}

onPressedRowDetail(String moduleNombre, BuildContext context, int id) {
  if (moduleNombre == 'Usuarios') {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => ViewUser(idUser: id),
      ),
    );
  } else if (moduleNombre == 'Empresas') {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => ViewCompany(idCompany: id),
      ),
    );
  }
  print('pressed');
}

// Create enum for table types
enum TableType {
  contacts(valueMap: {
    'Nro': 1,
    'Nombre': 2,
    'DNI': 2,
    'Cargo': 3,
    'Detalle': 2,
  }),
  companies(valueMap: {
    'N°': 1,
    'Empresa': 4,
    'RUC': 4,
    'Ubicación': 6,
    'Detalle': 2,
  }),
  users(valueMap: {
    'N°': 1,
    'Asesor': 3,
    'Cargo': 3,
    'Tareas pendientes': 1,
    'Leads  creados': 1,
    'Ventas Ganadas': 1,
    'Detalle': 2,
  }),
  projects(valueMap: {
    'N°': 1,
    'Proyecto': 2,
    '%Avanzado': 2,
    'Presupuesto': 3,
    'Fecha de Cierre': 3,
    'Detalle': 3
  });

  const TableType({required this.valueMap});
  final Map<String, int> valueMap;
}
