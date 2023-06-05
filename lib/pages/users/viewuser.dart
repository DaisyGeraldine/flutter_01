import 'dart:math';

import 'package:flutter/cupertino.dart';

class ViewUser extends StatefulWidget {
  const ViewUser({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ViewUser createState() => _ViewUser();
}

class _ViewUser extends State<ViewUser> {

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Mi perfil', style: TextStyle(color: CupertinoColors.white)),
        backgroundColor: Color.fromARGB(255, 0, 90, 193), 
        ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 200,
                height: 200,           
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    image: const DecorationImage(
                        image: AssetImage('assets/images/icono_usuario.png'),
                        fit: BoxFit.cover),
                    color: const Color.fromARGB(255, 218, 218, 228),
                  ),
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(left: 20, top: 20),
                child: const Text(
                  'Datos Generales',
                  style: TextStyle(
                    color: Color.fromARGB(255, 0,90,193),
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(0),
                child: Form(
                  autovalidateMode: AutovalidateMode.always,
                  onChanged: () {
                    Form.maybeOf(primaryFocus!.context!)?.save();
                  },
                  child: Column(                  
                      //backgroundColor: CupertinoColors.inactiveGray,
                      //header: const Text('Datos Generales', style: TextStyle(color: Color.fromARGB(255, 0,90,193), fontWeight: FontWeight.bold, fontSize: 22,)),  
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: CupertinoTextFormFieldRow(
                                prefix: const Text('Nombre:      ', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.bold, fontSize: 16,)),
                                placeholder: 'Enter text',
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Color.fromARGB(102,102,102, 102),
                                      width: 0.3),
                                  ),
                                ),
                              ),
                            ),
                            CupertinoButton(
                              minSize: 15,
                              padding: EdgeInsets.zero,
                              child: const Icon(
                                CupertinoIcons.pencil,
                                color: CupertinoColors.systemGrey,
                              ),
                              onPressed: () {
                                // Respond to button press
                              },
                            ),
                            Expanded(
                              child: CupertinoTextFormFieldRow(
                                prefix: const Text('Cargo:           ', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.bold, fontSize: 16,)),
                                placeholder: 'Enter text',
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Color.fromARGB(102,102,102, 102),
                                      width: 0.3),
                                  ),
                                ),
                              ),
                            ),
                            CupertinoButton(
                              minSize: 15,
                              padding: EdgeInsets.zero,
                              child: const Icon(
                                CupertinoIcons.pencil,
                                color: CupertinoColors.systemGrey,
                              ),
                              onPressed: () {
                                // Respond to button press
                              },
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: CupertinoTextFormFieldRow(
                                prefix: const Text('DNI:             ', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.bold, fontSize: 16,)),
                                placeholder: 'Enter text',
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Color.fromARGB(102,102,102, 102),
                                      width: 0.3),
                                  ),
                                ),
                              ),
                            ),
                            CupertinoButton(
                              minSize: 15,
                              padding: EdgeInsets.zero,
                              child: const Icon(
                                CupertinoIcons.pencil,
                                color: CupertinoColors.systemGrey,
                              ),
                              onPressed: () {
                                // Respond to button press
                              },
                            ),
                            Expanded(
                              child: CupertinoTextFormFieldRow(
                                prefix: const Text('Contraseña:  ', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.bold, fontSize: 16,)),
                                placeholder: 'Enter text',
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Color.fromARGB(102,102,102, 102),
                                      width: 0.3),
                                  ),
                                ),
                              ),
                            ),
                            CupertinoButton(
                              minSize: 15,
                              padding: EdgeInsets.zero,
                              child: const Icon(
                                CupertinoIcons.pencil,
                                color: CupertinoColors.systemGrey,
                              ),
                              onPressed: () {
                                // Respond to button press
                              },
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: CupertinoTextFormFieldRow(
                                prefix: const Text('Teléfono:     ', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.bold, fontSize: 16,)),
                                placeholder: 'Enter text',
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Color.fromARGB(102,102,102, 102),
                                      width: 0.3),
                                  ),
                                ),
                              ),
                            ),
                            CupertinoButton(
                              minSize: 15,
                              padding: EdgeInsets.zero,
                              child: const Icon(
                                CupertinoIcons.pencil,
                                color: CupertinoColors.systemGrey,
                              ),
                              onPressed: () {
                                // Respond to button press
                              },
                            ),
                            Expanded(
                              child: CupertinoTextFormFieldRow(
                                prefix: const Text('Correo:         ', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.bold, fontSize: 16,)),
                                placeholder: 'Enter text',
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Color.fromARGB(102,102,102, 102),
                                      width: 0.3),
                                  ),
                                ),
                              ),
                            ),
                            CupertinoButton(
                              minSize: 15,
                              padding: EdgeInsets.zero,
                              child: const Icon(
                                CupertinoIcons.pencil,
                                color: CupertinoColors.systemGrey,
                              ),
                              onPressed: () {
                                // Respond to button press
                              },
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: CupertinoTextFormFieldRow(
                                prefix: const Text('Dirección:    ', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.bold, fontSize: 16,)),
                                placeholder: 'Enter text',
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Color.fromARGB(102,102,102, 102),
                                      width: 0.3),
                                  ),
                                ),
                              ),
                            ),
                            CupertinoButton(
                              minSize: 15,
                              padding: EdgeInsets.zero,
                              child: const Icon(
                                CupertinoIcons.pencil,
                                color: CupertinoColors.systemGrey,
                              ),
                              onPressed: () {
                                // Respond to button press
                              },
                            ),
                            Expanded(child: Container()),
                            //corregir
                            CupertinoButton(
                              minSize: 15,
                              padding: EdgeInsets.zero,
                              child: const Icon(
                                CupertinoIcons.pencil,
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                              onPressed: () {
                                // Respond to button press
                              },
                            ),
                          ],
                        ),
                      ],
                    ),                
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(left: 20, top: 20),
                child: const Text(
                  'Metas',
                  style: TextStyle(
                    color: Color.fromARGB(255, 0,90,193),
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(0),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 20, top: 20),
                      child: Row(
                        children:[ 
                          const Text('Mes:     ',
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                          CupertinoButton(
                            padding: const EdgeInsets.all(10),
                            disabledColor: const Color.fromARGB(255, 233, 233, 236),
                            color: const Color.fromARGB(255, 233, 233, 236),
                            child: const Text('Enero 2023', style: TextStyle(color: CupertinoColors.black),),
                            onPressed: () {
                              // Respond to button press
                            },
                          ),
                        ]
                      ),
                    ),
                    const SizedBox(width: 70),
                    Expanded(
                      child: CupertinoTextFormFieldRow(
                        prefix: const Text('Por \npresupuesto:         ', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.bold, fontSize: 17,)),
                        placeholder: 'Enter text',
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Color.fromARGB(102,102,102, 102),
                              width: 0.3),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: CupertinoTextFormFieldRow(
                        prefix: const Text('Por \nCantidad:            ', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.bold, fontSize: 17,)),
                        placeholder: 'Enter text',
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Color.fromARGB(102,102,102, 102),
                              width: 0.3),
                          ),
                        ),
                      ),
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