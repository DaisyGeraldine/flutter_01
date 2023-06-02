//import 'package:drawer_views_project/DataBase/crud.dart';
import 'package:drawer_views_project/DataBase/db.dart';
import 'package:flutter/cupertino.dart';

class AddUser extends StatefulWidget {
  const AddUser({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AddUser createState() => _AddUser();
}

class _AddUser extends State < AddUser >{

  final nameAsesor = TextEditingController();
  final dniAsesor = TextEditingController();
  final tipoAsesor = TextEditingController();
  final emailAsesor = TextEditingController();
  final passwordAsesor = TextEditingController();
  final roleAsesor = TextEditingController();
  final phoneAsesor = TextEditingController();
  final addressAsesor = TextEditingController();
  DBase dbase = DBase();

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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/icono_usuario.png'),
                    fit: BoxFit.cover
                  ),
                  color: const Color.fromARGB(255, 179, 179, 187)
                ),
                //child: Image.asset('assets/images/icono_usuario.png', width: 200, height: 200,),
              ),

              Row(
                children: [
                  Container(
                    //alignment: Alignment.centerLeft,
                    width: 500,
                    child: Column(
                      children: [
                        CupertinoTextFormFieldRow(decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: CupertinoColors.systemGrey, width: 0.3),),), placeholder: 'Nombre', controller: nameAsesor,),                     
                        CupertinoTextFormFieldRow(decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: CupertinoColors.systemGrey, width: 0.3),),), placeholder: 'DNI', controller: dniAsesor,),
                        CupertinoTextFormFieldRow(decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: CupertinoColors.systemGrey, width: 0.3),),), placeholder: 'Tipo de Usuario', controller: tipoAsesor,),
                        CupertinoTextFormFieldRow(decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: CupertinoColors.systemGrey, width: 0.3),),), placeholder: 'Correo', controller: emailAsesor,),                     
                      ],),
                  ),
                  Container(
                  width: 500,
                  //alignment: Alignment.centerRight,
                  child: Column(
                    children: [
                      CupertinoTextFormFieldRow(decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: CupertinoColors.systemGrey, width: 0.3),),), placeholder: 'Cargo del Asesor', controller: roleAsesor,),
                      CupertinoTextFormFieldRow(decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: CupertinoColors.systemGrey, width: 0.3),),), placeholder: 'Contraseña', controller: passwordAsesor,),
                      CupertinoTextFormFieldRow(decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: CupertinoColors.systemGrey, width: 0.3),),), placeholder: 'Telefono', controller: phoneAsesor,),
                      CupertinoTextFormFieldRow(decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: CupertinoColors.systemGrey, width: 0.3),),), placeholder: 'Direccion', controller: addressAsesor,)
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
                      Row(
                        children: [
                          CupertinoButton(
                            onPressed: (){Navigator.pop(context);},
                            child: const Text('Cancelar', style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          const SizedBox(width: 8),
                          CupertinoButton.filled(
                            onPressed: (){
                              
                              dbase.insert({'name': nameAsesor.text, 'dni': dniAsesor.text, 'tipo':tipoAsesor.text, 'email': emailAsesor.text, 'password': passwordAsesor.text, 'role': roleAsesor.text, 'phone': phoneAsesor.text, 'address': addressAsesor.text});
                            },
                            child: const Text('Crear', style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ],
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