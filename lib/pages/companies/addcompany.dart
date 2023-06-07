import 'package:drawer_views_project/DataBase/db.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final nameCompany = TextEditingController();
final rucCompany = TextEditingController();
final addressCompany = TextEditingController();
final _formKey = GlobalKey<FormState>();
DBase dbase = DBase();

void onTapAddCompany(BuildContext context) async {

  showDialog(
    context: context,
    builder: (context) {

      return SimpleDialog(
        titlePadding: EdgeInsets.zero,
        title: Container(
          alignment: Alignment.center,
          color: const Color.fromARGB(255, 249, 249, 249).withOpacity(0.94),
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: const Text('Añadir  Empresa', style: TextStyle(fontSize: 17),),
        ),
        contentPadding: const EdgeInsets.only(left: 50.0, right: 50.0, bottom: 40.0, top: 40.0),
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.3,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  CupertinoTextField(
                    placeholder: 'Razón Social',
                    suffix: GestureDetector(
                      onTap: () {
                        nameCompany.clear();
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
                    controller: nameCompany,
                  ),
                  const SizedBox(height: 10.0),
                  CupertinoTextField(
                    placeholder: 'RUC',
                    suffix: GestureDetector(
                      onTap: () {
                        rucCompany.clear();
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
                    //only input numbers are 11 digits
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(11),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    onChanged: (value) {
                      onChangedExistRuc(value, context);
                    },
                    keyboardType: TextInputType.number,     
                    controller: rucCompany,                           
                  ),
                  const SizedBox(height: 10.0),
                  CupertinoTextField(
                    placeholder: 'Dirección Legal',
                    suffix: GestureDetector(
                      onTap: () {
                        addressCompany.clear();
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
                    controller: addressCompany,
                  ),
                  const SizedBox(height: 60.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CupertinoButton(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        onPressed: () {
                          onTapCancel(context);
                        },
                        child: const Text('Cancelar', style: TextStyle(color: Color.fromARGB(255, 0, 90, 193), fontWeight: FontWeight.bold),),),
                      
                      const SizedBox(width: 10.0),
                      CupertinoButton(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        color: const Color.fromARGB(255, 0, 90, 193),
                        onPressed: () {
                          onTapCreateCompany(context);
                        },
                        child: const Text('Crear', style: TextStyle(color: CupertinoColors.white, fontWeight: FontWeight.bold),),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                ],
              ),
            ),
          )
        ],
      );
    }
  );
}

void onTapCancel (BuildContext context){
  nameCompany.clear();
  rucCompany.clear();
  addressCompany.clear();
  Navigator.pop(context);
}

onChangedExistRuc(String value,BuildContext context) async {

  if (value.length == 11) {
    print('ruc: $value'); 
    bool exist = await dbase.existRuc(value);
    if (exist) {
      print('ruc exist');
      rucCompany.clear();
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: const Text('Error'),
            content: const Text('El RUC ingresado ya existe'),
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
    }
  }


}

void onTapCreateCompany (BuildContext context){

  BuildContext currentContext = context;


  //validate if the ruc is 11 digits
  if (rucCompany.text.length < 11) {
    rucCompany.clear();
    showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text('Error'),
          content: const Text('El RUC debe tener 11 dígitos'),
          actions: [
            CupertinoDialogAction(
              child: const Text('Aceptar'),
              onPressed: () {
                Navigator.pop(context);
                return;
              },
            ),
          ],
        );
      }
    );
  }

  //validate fields
  if (nameCompany.text.isEmpty || rucCompany.text.isEmpty || addressCompany.text.isEmpty) {
    showCupertinoDialog(
      context: currentContext,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text('Campos Vacios'),
          content: const Text('Por favor, llene todos los campos'),
          actions: [
            CupertinoDialogAction(
              child: const Text('OK'),
              onPressed: () {
                Navigator.pop(currentContext);       
              },
            ),
          ],
        );
      },
    );
    return;
  }

  dbase.insertCompany({
    'company_name': nameCompany.text,
    'ruc' : rucCompany.text,
    'legal_address' : addressCompany.text,
  });
  // Show a cupertino dialog to show the user was created
  showCupertinoDialog(
    context: currentContext,
    builder: (context) {
      return CupertinoAlertDialog(
        title: const Text('Empresa Creada'),
        content: const Text('La empresa ha sido creado exitosamente'),
        actions: [
          CupertinoDialogAction(
            child: const Text('OK'),
            onPressed: () {
              nameCompany.clear();
              rucCompany.clear();
              addressCompany.clear();
              Navigator.pop(currentContext);
              Navigator.pop(currentContext);
            },
          ),
        ],
      );
    },
  );
}