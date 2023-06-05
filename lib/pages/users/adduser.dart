//import 'package:drawer_views_project/DataBase/crud.dart';
import 'package:drawer_views_project/DataBase/db.dart';
import 'package:drawer_views_project/pages/users/users.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class AddUser extends StatefulWidget {
  const AddUser({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AddUser createState() => _AddUser();
}

class _AddUser extends State<AddUser> {
  final nameAsesor = TextEditingController();
  final dniAsesor = TextEditingController();
  final tipoAsesor = TextEditingController();
  final emailAsesor = TextEditingController();
  final passwordAsesor = TextEditingController();
  final roleAsesor = TextEditingController();
  final phoneAsesor = TextEditingController();
  final addressAsesor = TextEditingController();
  DBase dbase = DBase();

  // Create a key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text('Agregar Usuario'),
          backgroundColor: Color(0x00ffffff),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      image: const DecorationImage(
                          image: AssetImage('assets/images/icono_usuario.png'),
                          fit: BoxFit.cover),
                      color: const Color.fromARGB(255, 179, 179, 187)),
                  //child: Image.asset('assets/images/icono_usuario.png', width: 200, height: 200,),
                ),
                //const SizedBox(width: 40),
                Padding(
                  padding: const EdgeInsets.all(40),
                  child: Row(
                    children: [
                      Expanded(
                        //alignment: Alignment.centerLeft,         
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              CupertinoTextFormFieldRow(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                        color: Color.fromARGB(102,102,102, 102),
                                        width: 0.3),
                                  ),
                                ),
                                placeholder: 'Nombre',
                                controller: nameAsesor,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Por favor ingrese su nombre';
                                  }
                                  return null;
                                },
                              ),
                              CupertinoTextFormFieldRow(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                        color: Color.fromARGB(102,102,102, 102),
                                        width: 0.3),
                                  ),
                                ),
                                placeholder: 'DNI',
                                controller: dniAsesor,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(8),
                                  // Only numbers can be entered
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Por favor ingrese su DNI';
                                  }
                                  return null;
                                },
                              ),

                              CupertinoTextFormFieldRow(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                        color: Color.fromARGB(102,102,102, 102),
                                        width: 0.3),
                                  ),
                                ),
                                placeholder: 'Tipo de Usuario',
                                controller: tipoAsesor,
                              ),
                              CupertinoTextFormFieldRow(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                        color: Color.fromARGB(102,102,102, 102),
                                        width: 0.3),
                                  ),
                                ),
                                placeholder: 'Correo',
                                controller: emailAsesor,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Por favor ingrese su correo';
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        //alignment: Alignment.centerRight,
                        child: Form(
                          key: _formKey2,
                          child: Column(
                            children: [
                              CupertinoTextFormFieldRow(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                        color: Color.fromARGB(102,102,102, 102),
                                        width: 0.3),
                                  ),
                                ),
                                placeholder: 'Cargo del Asesor',
                                controller: roleAsesor,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Por favor ingrese su cargo';
                                  }
                                  return null;
                                },
                              ),
                              CupertinoTextFormFieldRow(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                        color: Color.fromARGB(102,102,102, 102),
                                        width: 0.3),
                                  ),
                                ),
                                placeholder: 'Contraseña',
                                controller: passwordAsesor,
                                obscureText: true,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Por favor ingrese su contraseña';
                                  }
                                  return null;
                                },
                              ),
                              CupertinoTextFormFieldRow(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                        color: Color.fromARGB(102,102,102, 102),
                                        width: 0.3),
                                  ),
                                ),
                                placeholder: 'Telefono',
                                controller: phoneAsesor,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(9),
                                  // Only numbers can be entered
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                              ),
                              CupertinoTextFormFieldRow(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                        color: Color.fromARGB(102,102,102, 102),
                                        width: 0.3),
                                  ),
                                ),
                                placeholder: 'Direccion',
                                controller: addressAsesor,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CupertinoButton(
                        padding: EdgeInsets.symmetric(horizontal: 26),
                        color: const Color.fromARGB(255, 255, 255, 255),
                        onPressed: onTapCancel,
                        child: const Text(
                          'Cancelar',
                          style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(255,0,90,193),),
                        ),
                      ),
                      const SizedBox(width: 30),
                      CupertinoButton(
                        padding: EdgeInsets.symmetric(horizontal: 26),
                        color: const Color.fromARGB(255,0,90,193),
                        onPressed: onTapCreate,
                        child: const Text(
                          'Crear',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(width: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  void onTapCancel() {
    Navigator.pop(context);
  }

  void onTapCreate() async {
    // showDialog(
    //     context: context,
    //     builder: (context) {
    //       return SimpleDialog(
    //         titlePadding: EdgeInsets.zero,
    //         title: Container(
    //           child: Text('Añadir  Empresa'),
    //           alignment: Alignment.center,
    //           color: Color(0xFFF9F9F9).withOpacity(0.94),
    //           padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
    //         ),
    //         contentPadding: EdgeInsets.all(20.0),
    //         children: [
    //           SizedBox(
    //             width: MediaQuery.of(context).size.width * 0.5,
    //             child: Column(
    //               children: [
    //                 CupertinoTextField(
    //                   placeholder: 'Razón Social',
    //                 ),
    //                 SizedBox(height: 10.0),
    //                 CupertinoTextField(
    //                   placeholder: 'RUC',
    //                   suffix: GestureDetector(
    //                     onTap: () {
    //                       print('Se elimino el contenido del campo');
    //                     },
    //                     child: Icon(
    //                       CupertinoIcons.delete,
    //                       color: CupertinoColors.systemGrey,
    //                     ),
    //                   ),
    //                 ),
    //                 SizedBox(height: 10.0),
    //                 CupertinoTextField(
    //                   placeholder: 'Dirección',
    //                 ),
    //                 SizedBox(height: 30.0),
    //                 Row(
    //                   mainAxisAlignment: MainAxisAlignment.end,
    //                   children: [
    //                     CupertinoButton(
    //                       onPressed: () {
    //                         Navigator.pop(context);
    //                       },
    //                       child: Text('Cancelar'),
    //                     ),
    //                     SizedBox(width: 10.0),
    //                     CupertinoButton.filled(
    //                       onPressed: () {},
    //                       child: Text('Crear'),
    //                     ),
    //                   ],
    //                 )
    //               ],
    //             ),
    //           )
    //         ],
    //       );
    //     });

    // validar campos
    bool valid = _formKey.currentState!.validate();
    bool valid2 = _formKey2.currentState!.validate();
    if (!valid || !valid2) {
      return;
    }
    //--------
    dbase.insert({
      'name': nameAsesor.text,
      'dni': dniAsesor.text,
      'tipo': tipoAsesor.text,
      'email': emailAsesor.text,
      'password': passwordAsesor.text,
      'role': roleAsesor.text,
      'phone': phoneAsesor.text,
      'address': addressAsesor.text,
    });
    // Show a cupertino dialog to show the user was created
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text('Usuario Creado'),
          content: const Text('El usuario ha sido creado exitosamente'),
          actions: [
            CupertinoDialogAction(
              child: const Text('OK'),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
