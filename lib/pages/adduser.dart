import 'package:flutter/cupertino.dart';

class AddUser extends StatefulWidget {
  const AddUser({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AddUser createState() => _AddUser();
}

class _AddUser extends State < AddUser >{
  
  @override
  Widget build(BuildContext context){
     return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Agregar Usuario'),
        backgroundColor:Color(0x00ffffff),
      ), 
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    width: 500,
                    child: const Column(
                      children: [
                        CupertinoTextField(placeholder: 'Nombre del Asesor',),
                        CupertinoTextField(placeholder: 'Correo Electrónico',),
                        CupertinoTextField(placeholder: 'Tipo de Usuario',),
                        CupertinoTextField(placeholder: 'Correo',),
                      ],),
                  ),
                  Container(
                  width: 500,
                  alignment: Alignment.centerRight,
                  child: const Column(
                    children: [
                      CupertinoTextField(placeholder: 'Cargo del Asesor',),
                      CupertinoTextField(placeholder: 'Contraseña',),
                      CupertinoTextField(placeholder: 'Telefono',),
                      CupertinoTextField(placeholder: 'Direccion',)
                    ],),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.topRight,
                child: SizedBox(
                  width: 500,
                  child: Column(
                    children: [
                      CupertinoButton.filled(
                        onPressed: (){},
                        child: const Text('Cancelar'), 
                      ),
                      CupertinoButton(
                        color: CupertinoColors.systemRed,
                        onPressed: (){},
                        child: const Text('Guardar'),
                      ),
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      )
    );
  }
}