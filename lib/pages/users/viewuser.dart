import 'package:drawer_views_project/DataBase/db.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class ViewUser extends StatefulWidget {
  final int  idUser;

  const ViewUser({
    Key? key, 
    required this.idUser,
  })
  : super(key: key);
    


  @override
  // ignore: library_private_types_in_public_api
  _ViewUser createState() => _ViewUser();
}

class _ViewUser extends State<ViewUser> {
  DBase dbase = DBase();
  List<Users> userL = [];
  TextEditingController nameAsesor = TextEditingController();
  TextEditingController dniAsesor = TextEditingController();
  TextEditingController tipoAsesor = TextEditingController();
  TextEditingController emailAsesor = TextEditingController();
  TextEditingController passwordAsesor = TextEditingController();
  TextEditingController roleAsesor = TextEditingController();
  TextEditingController phoneAsesor = TextEditingController();
  TextEditingController addressAsesor = TextEditingController();

  @override
  void initState() {
    print('widget user: '+ widget.idUser.toString());
    _loadUser();
    super.initState();
  }

  _loadUser() async {
    List<Users> auxUser = await dbase.queryUserById(widget.idUser);

    setState(() {
      userL = auxUser;
      nameAsesor = TextEditingController(text: userL[0].toJson()['Nombre'].toString());
      dniAsesor = TextEditingController(text: userL[0].toJson()['Dni'].toString());
      tipoAsesor = TextEditingController(text: userL[0].toJson()['Tipo'].toString());
      emailAsesor = TextEditingController(text: userL[0].toJson()['Correo'].toString());
      passwordAsesor = TextEditingController(text: userL[0].toJson()['Contraseña'].toString());
      roleAsesor = TextEditingController(text: userL[0].toJson()['Cargo'].toString());
      phoneAsesor = TextEditingController(text: userL[0].toJson()['Telefono'].toString());
      addressAsesor = TextEditingController(text: userL[0].toJson()['Direccion'].toString());
      print(userL[0].toJson());
      }
    );
  }
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Mi perfil', style: TextStyle(color: CupertinoColors.white)),
        backgroundColor: Color.fromARGB(255, 0, 90, 193), 
        ),
      child: 
      userL.isEmpty 
      ?
      const CircularProgressIndicator()
      :
      SafeArea(

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
                  //onChanged: () {
                   // Form.maybeOf(primaryFocus!.context!)?.save();
                  //},
                  child: Column(                  
                      //backgroundColor: CupertinoColors.inactiveGray,
                      //header: const Text('Datos Generales', style: TextStyle(color: Color.fromARGB(255, 0,90,193), fontWeight: FontWeight.bold, fontSize: 22,)),  
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: CupertinoTextFormFieldRow(
                                prefix: const Text('Nombre:      ', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.bold, fontSize: 16,)),
                                //initialValue: userL[0].toJson()['Nombre'].toString(),
                                //readOnly: true,      
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Color.fromARGB(102,102,102, 102),
                                      width: 0.3),
                                  ),
                                ),
                                controller: nameAsesor,
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
                                onTapUdate("El Nombre");
                              },
                            ),
                            Expanded(
                              child: CupertinoTextFormFieldRow(
                                prefix: const Text('Cargo:           ', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.bold, fontSize: 16,)),
                                //initialValue: userL[0].toJson()['Cargo'].toString(),
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Color.fromARGB(102,102,102, 102),
                                      width: 0.3),
                                  ),
                                ),
                                controller: roleAsesor,
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
                                onTapUdate("El Cargo");
                              },
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: CupertinoTextFormFieldRow(
                                prefix: const Text('DNI:             ', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.bold, fontSize: 16,)),
                                //initialValue: userL[0].toJson()['Dni'].toString(),
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Color.fromARGB(102,102,102, 102),
                                      width: 0.3),
                                  ),
                                ),
                                controller: dniAsesor,
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
                                onTapUdate("El Dni");
                              },
                            ),
                            Expanded(
                              child: CupertinoTextFormFieldRow(
                                prefix: const Text('Contraseña:  ', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.bold, fontSize: 16,)),
                                //initialValue: userL[0].toJson()['Contraseña'].toString(),
                                obscuringCharacter: '*',
                                obscureText: true,
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Color.fromARGB(102,102,102, 102),
                                      width: 0.3),
                                  ),
                                ),
                                controller: passwordAsesor,
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
                                onTapUdate("La contraseña");
                              },
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: CupertinoTextFormFieldRow(
                                prefix: const Text('Teléfono:     ', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.bold, fontSize: 16,)),
                                //initialValue: userL[0].toJson()['Telefono'].toString(),
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Color.fromARGB(102,102,102, 102),
                                      width: 0.3),
                                  ),
                                ),
                                controller: phoneAsesor,
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
                                onTapUdate("El telefono");
                              },
                            ),
                            Expanded(
                              child: CupertinoTextFormFieldRow(
                                prefix: const Text('Correo:         ', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.bold, fontSize: 16,)),
                                //initialValue: userL[0].toJson()['Correo'].toString(),
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Color.fromARGB(102,102,102, 102),
                                      width: 0.3),
                                  ),
                                ),
                                controller: emailAsesor,
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
                                onTapUdate("El correo");
                              },
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: CupertinoTextFormFieldRow(
                                prefix: const Text('Dirección:    ', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.bold, fontSize: 16,)),
                                ///initialValue: userL[0].toJson()['Direccion'].toString(),
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Color.fromARGB(102,102,102, 102),
                                      width: 0.3),
                                  ),
                                ),
                                controller: addressAsesor,
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
                                onTapUdate("La direccion");
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
                        placeholder: '2\'000 PEN',
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
                        placeholder: '150 Leads',
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
  onTapUdate(String campo) async {
     dbase.update({
      'id': widget.idUser,
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
          title: const Text('Usuario modificado'),
          content: Text('$campo ha sido modificado'),
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

