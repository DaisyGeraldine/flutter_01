import 'package:drawer_views_project/DataBase/db.dart';
import 'package:flutter/cupertino.dart';

///////////Campos de Contacto////////////////////////
final nameContact = TextEditingController();
final lastNameContact = TextEditingController();
final emailContact = TextEditingController();
final positionContact = TextEditingController();
final phoneContact = TextEditingController();
final hobbiesContact = TextEditingController();
final birthayContact = TextEditingController();
DBase dbase = DBase();
//create a key that uniquely identifies the form widget

class FormAddContact extends StatelessWidget {
  // ignore: non_constant_identifier_names
  const FormAddContact({super.key, required this.idCompany});
  final int idCompany;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        padding: const EdgeInsets.only(left: 20,right: 20, top: 20, bottom: 35),
        decoration: BoxDecoration(
          //color: const Color.fromARGB(255, 0,90,193),
          boxShadow: [BoxShadow(
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
            style: BorderStyle.solid
          ),),
        ),
        
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(left: 15,right: 15, top: 0, bottom: 20),
              child: const Text(
                'Contacto',
                style: TextStyle(
                  color: Color.fromARGB(255, 0,90,193),
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15,right: 35, top: 0, bottom: 0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        CupertinoTextField(
                          prefix: const Text('Nombres:', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.bold, fontSize: 17,)),
                          //initialValue: userL[0].toJson()['Cargo'].toString(),
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Color.fromARGB(102,102,102, 102),
                                width: 0.3),
                            ),
                          ),
                          suffix: CupertinoButton(
                            minSize: 15,
                            padding: EdgeInsets.only(right: 10),
                            child: const Icon(
                              CupertinoIcons.pencil,
                              color: CupertinoColors.systemGrey,
                            ),
                            onPressed: () {
                              
                            },
                          ),
                          controller: nameContact,
                        ),
                        const SizedBox(height: 10,),
                        CupertinoTextField(
                          prefix: const Text('Apellidos', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.bold, fontSize: 17,)),
                          //initialValue: userL[0].toJson()['Cargo'].toString(),
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Color.fromARGB(102,102,102, 102),
                                width: 0.3),
                            ),
                          ),
                          suffix: CupertinoButton(
                            minSize: 15,
                            padding: EdgeInsets.only(right: 10),
                            child: const Icon(
                              CupertinoIcons.pencil,
                              color: CupertinoColors.systemGrey,
                            ),
                            onPressed: () {
                            },
                          ),
                          controller: lastNameContact,
                        ),
                        const SizedBox(height: 10,),
                        CupertinoTextField(
                          prefix: const Text('Correo', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.bold, fontSize: 17,)),
                          //initialValue: userL[0].toJson()['Cargo'].toString(),
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Color.fromARGB(102,102,102, 102),
                                width: 0.3),
                            ),
                          ),
                          suffix: CupertinoButton(
                            minSize: 15,
                            padding: EdgeInsets.only(right: 10),
                            child: const Icon(
                              CupertinoIcons.pencil,
                              color: CupertinoColors.systemGrey,
                            ),
                            onPressed: () {
                            },
                          ),
                          controller: emailContact,
                        ),
                        const SizedBox(height: 10,),
                        CupertinoButton(
                          //minSize: 15,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.only(right: 10),
                          child: const Row(
                            children: [
                              Icon(
                                CupertinoIcons.add_circled_solid,
                                color: Color.fromARGB(255, 52,199,89),
                              ),
                              Text('Correo', style: TextStyle(color: Color.fromARGB(118, 60, 60, 67), fontSize: 17,)  ,),
                            ],
                          ),
                          onPressed: () {
                          },
                        ),
                        const SizedBox(height: 10,),
                        CupertinoTextField(
                          prefix: const Text('Telefóno:', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.bold, fontSize: 17,)),
                          //initialValue: userL[0].toJson()['Cargo'].toString(),
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Color.fromARGB(102,102,102, 102),
                                width: 0.3),
                            ),
                          ),
                          suffix: CupertinoButton(
                            minSize: 15,
                            padding: EdgeInsets.only(right: 10),
                            child: const Icon(
                              CupertinoIcons.pencil,
                              color: CupertinoColors.systemGrey,
                            ),
                            onPressed: () {
                            },
                          ),
                          controller: phoneContact,
                        ),
                        const SizedBox(height: 10,),
                        CupertinoButton(
                          //minSize: 15,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.only(right: 10),
                          child: const Row(
                            children: [
                              Icon(
                                CupertinoIcons.add_circled_solid,
                                color: Color.fromARGB(255, 52,199,89),
                              ),
                              Text('Telefóno', style: TextStyle(color: Color.fromARGB(118, 60, 60, 67), fontSize: 17,)  ,),
                            ],
                          ),
                          onPressed: () {
                          },
                        ),
                        
                      ],
                    )
                  ),
                  const SizedBox(width: 40,),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CupertinoTextField(
                          prefix: const Text('Cargo:', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.bold, fontSize: 17,)),
                          //initialValue: userL[0].toJson()['Cargo'].toString(),
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Color.fromARGB(102,102,102, 102),
                                width: 0.3),
                            ),
                          ),
                          suffix: CupertinoButton(
                            minSize: 15,
                            padding: EdgeInsets.only(right: 10),
                            child: const Icon(
                              CupertinoIcons.pencil,
                              color: CupertinoColors.systemGrey,
                            ),
                            onPressed: () {
                            },
                          ),
                          controller: positionContact,
                        ),
                        const SizedBox(height: 10,),
                        CupertinoTextField(
                          prefix: const Text('Hobbie:', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.bold, fontSize: 17,)),
                          //initialValue: userL[0].toJson()['Cargo'].toString(),
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Color.fromARGB(102,102,102, 102),
                                width: 0.3),
                            ),
                          ),
                          suffix: CupertinoButton(
                            minSize: 15,
                            padding: EdgeInsets.only(right: 10),
                            child: const Icon(
                              CupertinoIcons.pencil,
                              color: CupertinoColors.systemGrey,
                            ),
                            onPressed: () {
                            },
                          ),
                          controller: hobbiesContact,
                        ),
                        const SizedBox(height: 10,),
                        CupertinoTextField(
                          prefix: const Text('Cumpleaños:', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.bold, fontSize: 17,)),
                          //initialValue: userL[0].toJson()['Cargo'].toString(),
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Color.fromARGB(102,102,102, 102),
                                width: 0.3),
                            ),
                          ),
                          suffix: CupertinoButton(
                            minSize: 15,
                            padding: const EdgeInsets.only(right: 10),
                            child: const Icon(
                              CupertinoIcons.pencil,
                              color: CupertinoColors.systemGrey,
                            ),
                            onPressed: () {
                            },
                          ),
                          controller: birthayContact,
                        ),
                        const SizedBox(height: 150,),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: CupertinoButton(
                            //alignment: Alignment.topRight,
                            padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                            color: const Color.fromARGB(255, 0, 90, 193),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(CupertinoIcons.add, color: CupertinoColors.white),
                                SizedBox(width: 8),
                                Text('Guardar',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold, color: CupertinoColors.white, fontSize: 17,),),
                              ],
                            ),
                            onPressed: () {
                              onTapCreateContact(context, idCompany);
                            },
                          ),
                        ),
                      ],
                    )
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void onTapCreateContact (BuildContext context, int idCompany){

  BuildContext currentContext = context;

  //validate fields
  if (nameContact.text.isEmpty || lastNameContact.text.isEmpty || emailContact.text.isEmpty || positionContact.text.isEmpty || phoneContact.text.isEmpty) {
    showCupertinoDialog(
      context: currentContext,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text('Error'),
          content: const Text('Por favor llene todos los campos necesarios'),
          actions: [
            CupertinoDialogAction(
              child: const Text('OK'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
    return;
  }

  dbase.insert('contact',{
    'name': nameContact.text,
    'lastname' : lastNameContact.text,
    'email': emailContact.text,
    'role': positionContact.text,
    'phone': phoneContact.text,
    'hobbies': hobbiesContact.text,
    'birthday': birthayContact.text,
    'company_id': idCompany,
  });
  // Show a cupertino dialog to show the user was created
  showCupertinoDialog(
    
    context: currentContext,
    builder: (context) {
      return CupertinoAlertDialog(
        title: const Text('Contacto Creado'),
        content: const Text('El contacto ha sido creado exitosamente'),
        actions: [
          CupertinoDialogAction(
            child: const Text('OK'),
            onPressed: () {
              nameContact.clear();
              lastNameContact.clear();
              emailContact.clear();
              positionContact.clear();
              phoneContact.clear();
              hobbiesContact.clear();
              birthayContact.clear();

              Navigator.pop(currentContext);
              Navigator.pop(currentContext);
            },
          ),
        ],
      );
    },
  );
}
