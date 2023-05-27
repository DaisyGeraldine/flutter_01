import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ContactsPage createState() => _ContactsPage();
}

class _ContactsPage extends State < ContactsPage >{
  
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Contactos', style: TextStyle(color: Colors.white)),
        backgroundColor: Color.fromARGB(174, 7, 18, 230),
      ),
      child: Center(
        child: CupertinoScrollbar(
          child: ListView(
            children: [
              CupertinoSearchTextField(
                onChanged: (value) {
                  print(value);
                },
                placeholder: 'Buscar Contacto',
                style: const TextStyle(color: Colors.black, fontSize: 16),
                placeholderStyle: const TextStyle(color: Colors.grey),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(162, 233, 230, 230),
                ),
                
              ),
              DataTable(
                columns: const [
                  DataColumn(label: Text('Columna 1')),
                  DataColumn(label: Text('Columna 2')),
                  DataColumn(label: Text('Columna 3')),
                ],
                rows: const [
                  DataRow(cells: [
                    DataCell(Text('Celda 1')),
                    DataCell(Text('Celda 2')),
                    DataCell(Text('Celda 3')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Celda 4')),
                    DataCell(Text('Celda 5')),
                    DataCell(Text('Celda 6')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Celda 7')),
                    DataCell(Text('Celda 8')),
                    DataCell(Text('Celda 9')),
                  ]),
                ],
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
  ContactsColumns(1, "Julian Vargas Espinoza", "Key Account Manager", "Nombre de empresa 01", "+51 999 888 777", "icon"),
];
