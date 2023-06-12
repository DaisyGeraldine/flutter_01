import 'package:drawer_views_project/DataBase/db.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  bool isEditableName = true;
  bool isEditableDni = true;
  bool isEditableTipo = true;
  bool isEditableEmail = true;
  bool isEditablePassword = true;
  bool isEditableRole = true;
  bool isEditablePhone = true;
  bool isEditableAddress = true;
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
    bool resultado;
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
                                readOnly: isEditableName,
                                style: TextStyle(
                                  color: isEditableName ? CupertinoColors.systemGrey : CupertinoColors.black,
                                  fontSize: 17,
                                ),
                                onFieldSubmitted:(value) => {
                                  setState(() {
                                    isEditableName = true;
                                  }),
                                  FocusScope.of(context).requestFocus(),
                                  onTapUdate("El Nombre")
                                },
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
                                setState(() {
                                  isEditableName = false;
                                });
                                FocusScope.of(context).requestFocus();
                                //onTapUdate("El Nombre");
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
                                readOnly: isEditableRole,
                                style: TextStyle(
                                  color: isEditableRole ? CupertinoColors.systemGrey : CupertinoColors.black,
                                  fontSize: 17,
                                ),
                                onFieldSubmitted:(value) => {
                                  setState(() {
                                    isEditableRole = true;
                                  }),
                                  FocusScope.of(context).requestFocus(),
                                  onTapUdate("El Cargo")
                                },
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
                                setState(() {
                                  isEditableRole = false;
                                });
                                FocusScope.of(context).requestFocus();
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
                                readOnly: isEditableDni,
                                style: TextStyle(
                                  color: isEditableDni ? CupertinoColors.systemGrey : CupertinoColors.black,
                                  fontSize: 17,
                                ),
                                onFieldSubmitted:(value) async => {
                                  setState(() {
                                    isEditableDni = true;
                                  }),
                                  FocusScope.of(context).requestFocus(),
                                  // ignore: unrelated_type_equality_checks
                                  print('objeto' + onTapValidateDni("El Dni").toString()),
                                  resultado = await onTapValidateDni('campo'),
                                  print('resultado: ' + resultado.toString()),
                                  if (resultado == false)
                                  {
                                    print("El Dni es correcto"),
                                    onTapUdate("El Dni")
                                  }
                                },
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                                  LengthLimitingTextInputFormatter(8),]
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
                                setState(() {
                                  isEditableDni = false;
                                });
                                FocusScope.of(context).requestFocus();
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
                                readOnly: isEditablePassword,
                                style: TextStyle(
                                  color: isEditablePassword ? CupertinoColors.systemGrey : CupertinoColors.black,
                                  fontSize: 17,
                                ),
                                onFieldSubmitted:(value) => {
                                  setState(() {
                                    isEditablePassword = true;
                                  }),
                                  FocusScope.of(context).requestFocus(),
                                  onTapUdate("La contraseña")
                                },
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
                                setState(() {
                                  isEditablePassword = false;
                                });
                                FocusScope.of(context).requestFocus();
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
                                readOnly: isEditablePhone,
                                style: TextStyle(
                                  color: isEditablePhone ? CupertinoColors.systemGrey : CupertinoColors.black,
                                  fontSize: 17,
                                ),
                                onFieldSubmitted:(value) => {
                                  setState(() {
                                    isEditablePhone = true;
                                  }),
                                  FocusScope.of(context).requestFocus(),
                                  onTapUdate("El telefono")
                                },
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
                                setState(() {
                                  isEditablePhone = false;
                                });
                                FocusScope.of(context).requestFocus();
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
                                readOnly: isEditableEmail,
                                style: TextStyle(
                                  color: isEditableEmail ? CupertinoColors.systemGrey : CupertinoColors.black,
                                  fontSize: 17,
                                ),
                                onFieldSubmitted:(value) => {
                                  setState(() {
                                    isEditableEmail = true;
                                  }),
                                  FocusScope.of(context).requestFocus(),
                                  onTapUdate("El correo")
                                },
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
                                setState(() {
                                  isEditableEmail = false;
                                });
                                FocusScope.of(context).requestFocus();
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
                                readOnly: isEditableAddress,
                                style: TextStyle(
                                  color: isEditableAddress ? CupertinoColors.systemGrey : CupertinoColors.black,
                                  fontSize: 17,
                                ),
                                onFieldSubmitted:(value) => {
                                  setState(() {
                                    isEditableAddress = true;
                                  }),
                                  FocusScope.of(context).requestFocus(),
                                  onTapUdate("La direccion")
                                },
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
                                setState(() {
                                  isEditableAddress = false;
                                });
                                FocusScope.of(context).requestFocus();
                              },
                            ),
                            Expanded(child: Container()),
                            //corregir boton esta en blanco y no se ve ,para poder asemejar al maquetado
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

  Future<bool> onTapValidateDni(String campo) async {
    if (dniAsesor.text.length == 8) {
      print('DNI: $dniAsesor.texto'); 
      bool exist = await dbase.existDni(dniAsesor.text);
      if (exist) {
        print('DNI exist');
        //dniAsesor.clear();
        isEditableDni = false;
        // ignore: use_build_context_synchronously
        FocusScope.of(context).requestFocus();
        // ignore: use_build_context_synchronously
        showCupertinoDialog(
          context: context,
          builder: (context) {
            return CupertinoAlertDialog(
              title: const Text('Error'),
              content: const Text('El DNI ingresado ya existe'),
              actions: [
                CupertinoDialogAction(
                  child: const Text('Aceptar'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          }
        );
        return true;
      }
      return false;
    }

    if (dniAsesor.text.length < 8) {

      isEditableDni = false;
      FocusScope.of(context).requestFocus();
      // ignore: use_build_context_synchronously
      showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: const Text('Error'),
            content: const Text('El DNI debe tener 8 dígitos'),
            actions: [
              CupertinoDialogAction(
                child: const Text('Aceptar'),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
              ),
            ],
          );
        }
      );
      return true;
    }   
    return false;
  }

  onTapUdate(String campo) async {

     dbase.update('user',{
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
    // ignore: use_build_context_synchronously
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

