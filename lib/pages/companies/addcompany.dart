import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void onTapCreateCompany(BuildContext context) async {
  showDialog(
    context: context,
    builder: (context) {
      return SimpleDialog(
        titlePadding: EdgeInsets.zero,
        title: Container(
          alignment: Alignment.center,
          color: Color.fromARGB(255, 249, 249, 249).withOpacity(0.94),
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: const Text('Añadir  Empresa', style: TextStyle(fontSize: 17),),
        ),
        contentPadding: const EdgeInsets.only(left: 50.0, right: 50.0, bottom: 40.0, top: 40.0),
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.3,
            child: Column(
              children: [
                CupertinoTextField(
                  placeholder: 'Razón Social',
                  suffix: GestureDetector(
                    onTap: () {
                      print('Se elimino el contenido del campo');
                    },
                    child: const Icon(
                      CupertinoIcons.clear_circled_solid,
                      color: Color.fromARGB(255, 142,142,147),
                    ),
                  ),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          color: Color.fromARGB(102,102,102, 102),
                          width: 0.3),
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                CupertinoTextField(
                  placeholder: 'RUC',
                  suffix: GestureDetector(
                    onTap: () {
                      print('Se elimino el contenido del campo');
                    },
                    child: const Icon(
                      CupertinoIcons.clear_circled_solid,
                      color: Color.fromARGB(255, 142,142,147),
                    ),
                  ),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          color: Color.fromARGB(102,102,102, 102),
                          width: 0.3),
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                CupertinoTextField(
                  placeholder: 'Dirección Legal',
                  suffix: GestureDetector(
                    onTap: () {
                      print('Se elimino el contenido del campo');
                    },
                    child: const Icon(
                      CupertinoIcons.clear_circled_solid,
                      color: Color.fromARGB(255, 142,142,147),
                    ),
                  ),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          color: Color.fromARGB(102,102,102, 102),
                          width: 0.3),
                    ),
                  ),
                ),
                const SizedBox(height: 60.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CupertinoButton(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Cancelar', style: TextStyle(color: Color.fromARGB(255, 0, 90, 193), fontWeight: FontWeight.bold),),),
                    
                    const SizedBox(width: 10.0),
                    CupertinoButton(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      color: const Color.fromARGB(255, 0, 90, 193),
                      onPressed: () {},
                      child: const Text('Crear', style: TextStyle(color: CupertinoColors.white, fontWeight: FontWeight.bold),),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
              ],
            ),
          )
        ],
      );
    }
  );
}