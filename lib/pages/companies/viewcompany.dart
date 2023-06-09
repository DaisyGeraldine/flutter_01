
import 'package:drawer_views_project/DataBase/db.dart';
import 'package:drawer_views_project/pages/contacts/addcontact.dart';
import 'package:drawer_views_project/pages/contacts/viewcontactc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ViewCompany extends StatefulWidget {
  final int idCompany;

  const ViewCompany({
    Key? key,
    required this.idCompany,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ViewCompany createState() => _ViewCompany();
}

class _ViewCompany extends State < ViewCompany >{
  bool isFormVisible = false;

  bool isEditablename = true;
  bool isEditableRuc = true;
  bool isEditableAddress = true;
  bool isEditableEmail = true;
  bool isEditableWebPage = true;
  bool isEditableActivity = true;
  bool isEditablePhone = true;
  DBase dbase = DBase();
  List<Map<String, dynamic>> companyL = [];
  ////////////Campos de Empresa/////////////////////////
  TextEditingController nameCompany = TextEditingController();
  TextEditingController rucCompany = TextEditingController();
  TextEditingController addressCompany = TextEditingController();
  TextEditingController emailCompany = TextEditingController();
  TextEditingController webPageCompany = TextEditingController();
  TextEditingController activityCompany = TextEditingController();
  TextEditingController phoneCompany = TextEditingController();
  
  int lenCompany = 0;



  void toggleFormVisibility() {
    setState(() {
      isFormVisible = !isFormVisible;
    });
  }

  @override
  void initState() {
    print('widget user: '+ widget.idCompany.toString());
    _loadCompanyDetail();
    super.initState();
  }
  
  _loadCompanyDetail() async {
    List<Map<String, dynamic>> auxCompany = await dbase.queryCompanyDetailById(widget.idCompany);

      companyL = auxCompany;
      lenCompany = companyL.length;


      print(companyL[0]['id_company']);
      nameCompany = TextEditingController(text: companyL[0]['company_name'].toString());
      rucCompany = TextEditingController(text: companyL[0]['ruc'].toString());
      addressCompany = TextEditingController(text: companyL[0]['legal_address'].toString());
      emailCompany = TextEditingController(text: companyL[0]['email'].toString());
      webPageCompany = TextEditingController(text: companyL[0]['web_site'].toString());
      activityCompany = TextEditingController(text: companyL[0]['business_activity'].toString());
      phoneCompany = TextEditingController(text: companyL[0]['phone'].toString());

    setState(() {
      }
    );
  }

  @override
  Widget build(BuildContext context){
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Vista Empresa', style: TextStyle(color: CupertinoColors.white, fontSize: 20, fontWeight: FontWeight.bold)),
        backgroundColor: const Color.fromARGB(255, 0,90,193),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: (){},
          child: const Icon(CupertinoIcons.person),
          ),
        ),
      child: 
      companyL.isEmpty 
      ?
      const CircularProgressIndicator()
      :
      SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
          child: ListView(
            children: [
              Container( //contenedor de la informacion de la empresa
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
                          'Datos Generales',
                          style: TextStyle(
                            color: Color.fromARGB(255, 0,90,193),
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15,right: 35, top: 0, bottom: 20),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  CupertinoTextField(
                                    prefix: const Text('Razón Social:', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.bold, fontSize: 17,)),
                                    //initialValue: userL[0].toJson()['Cargo'].toString(),
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Color.fromARGB(102,102,102, 102),
                                          width: 0.3),
                                      ),
                                    ),
                                    controller: nameCompany,
                                    suffix: CupertinoButton(
                                      minSize: 15,
                                      padding: const EdgeInsets.only(right: 10),
                                      child: const Icon(
                                        CupertinoIcons.pencil,
                                        color: CupertinoColors.systemGrey,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          isEditablename = false;
                                        });
                                        FocusScope.of(context).requestFocus();
                                      },
                                    ),
                                    readOnly: isEditablename,
                                    style: TextStyle(
                                      color: isEditablename ? CupertinoColors.systemGrey : CupertinoColors.black,
                                      fontSize: 17,
                                    ),
                                    onSubmitted:(value) => {
                                      setState(() {
                                        isEditablename = true;
                                      }),
                                      FocusScope.of(context).requestFocus(),
                                      onTapUdate("La Razon Social")
                                    },
                                  ),
                                  const SizedBox(height: 10,),
                                  CupertinoTextField(
                                    prefix: const Text('RUC:', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.bold, fontSize: 17,)),
                                    //initialValue: userL[0].toJson()['Cargo'].toString(),
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Color.fromARGB(102,102,102, 102),
                                          width: 0.3),
                                      ),
                                    ),
                                    controller: rucCompany,
                                    suffix: CupertinoButton(
                                      minSize: 15,
                                      padding: const EdgeInsets.only(right: 10),
                                      child: const Icon(
                                        CupertinoIcons.pencil,
                                        color: CupertinoColors.systemGrey,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          isEditableRuc = false;
                                        });
                                        FocusScope.of(context).requestFocus();
                                      },
                                    ),                                      
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                      LengthLimitingTextInputFormatter(11),
                                    ],
                                    readOnly: isEditableRuc,
                                    style: TextStyle(
                                      color: isEditableRuc ? CupertinoColors.systemGrey : CupertinoColors.black,
                                      fontSize: 17,
                                    ),
                                    onSubmitted:(value) => {
                                      isEditableRuc = true,
                                      onTapUdate("El RUC")
                                    },
                                  ),
                                  const SizedBox(height: 10,),
                                  CupertinoTextField(
                                    prefix: const Text('Dirección Legal:', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.bold, fontSize: 17,)),
                                    //initialValue: userL[0].toJson()['Cargo'].toString(),
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Color.fromARGB(102,102,102, 102),
                                          width: 0.3),
                                      ),
                                    ),
                                    controller: addressCompany,
                                    suffix: CupertinoButton(
                                      minSize: 15,
                                      padding: const EdgeInsets.only(right: 10),
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
                                    readOnly: isEditableAddress,
                                    style: TextStyle(
                                      color: isEditableAddress ? CupertinoColors.systemGrey : CupertinoColors.black,
                                      fontSize: 17,
                                    ),
                                    onSubmitted:(value) => {
                                      isEditableAddress = true,
                                      onTapUdate("La Dirección Legal")
                                    },
                                  ),
                                  const SizedBox(height: 10,),
                                  CupertinoTextField(
                                    prefix: const Text('Correo:', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.bold, fontSize: 17,)),
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
                                        setState(() {
                                        isEditableEmail = false;
                                        });
                                        FocusScope.of(context).requestFocus();
                                      },
                                    ),
                                    controller: emailCompany,
                                    readOnly: isEditableEmail,
                                    style: TextStyle(
                                      color: isEditableEmail ? CupertinoColors.systemGrey : CupertinoColors.black,
                                      fontSize: 17,
                                    ),
                                    onSubmitted:(value) => {
                                      isEditableEmail = true,
                                      onTapUdate("El Correo")
                                    },
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
                                ],
                              )
                            ),
                            const SizedBox(width: 40,),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  CupertinoTextField(
                                    prefix: const Text('Página Web:', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.bold, fontSize: 17,)),
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
                                        setState(() {
                                        isEditableWebPage = false;
                                        });
                                        FocusScope.of(context).requestFocus();
                                      },
                                    ),
                                    controller: webPageCompany,
                                    readOnly: isEditableWebPage,
                                    style: TextStyle(
                                      color: isEditableWebPage ? CupertinoColors.systemGrey : CupertinoColors.black,
                                      fontSize: 17,
                                    ),
                                    onSubmitted:(value) => {
                                      isEditableWebPage = true,
                                      onTapUdate("La Página Web")
                                    },
                                  ),
                                  const SizedBox(height: 20,),
                                  CupertinoTextField(
                                    prefix: const Text('Actividad \nComercial:', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.bold, fontSize: 17,)),
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
                                        setState(() {
                                        isEditableActivity = false;
                                        });
                                        FocusScope.of(context).requestFocus();
                                      },
                                    ),
                                    controller: activityCompany,
                                    readOnly: isEditableActivity,
                                    style: TextStyle(
                                      color: isEditableActivity ? CupertinoColors.systemGrey : CupertinoColors.black,
                                      fontSize: 17,
                                    ),
                                    onSubmitted:(value) => {
                                      isEditableActivity = true,
                                      onTapUdate("La Actividad Comercial")
                                    },
                                  ),
                                  const SizedBox(height: 30,),
                                  CupertinoTextField(
                                    prefix: const Text('Teléfono:', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.bold, fontSize: 17,)),
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
                                        setState(() {
                                        isEditablePhone = false;
                                        });
                                        FocusScope.of(context).requestFocus();
                                      },
                                    ),
                                    controller: phoneCompany,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                      LengthLimitingTextInputFormatter(9),
                                    ],
                                    readOnly: isEditablePhone,
                                    style: TextStyle(
                                      color: isEditablePhone ? CupertinoColors.systemGrey : CupertinoColors.black,
                                      fontSize: 17,
                                    ),
                                    onSubmitted:(value) => {
                                      isEditablePhone = true,
                                      onTapUdate("El Teléfono")
                                    },
                                  ),
                                  const SizedBox(height: 10,),
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
                          ],
                        ),
                      ),
                    
                    ],
                  ),
                ),
                const SizedBox(height: 20,),
                ////////////////////////////////////////////////////
                if (companyL[0]['id_contact'] != null) 
                  for (int i = 0; i < lenCompany; i++)
                    FormViewContact(idContact: companyL[i]['id_contact'], count: i + 1),

                if (isFormVisible) FormAddContact(idCompany: widget.idCompany,),
                Container( //Contenedor del boton para agregar contacto
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
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 20),
                    child: CupertinoButton(
                      //minSize: 15,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(right: 10),
                      child: const Row(
                        children: [
                          Icon(
                            CupertinoIcons.add_circled_solid,
                            color: Color.fromARGB(255, 52,199,89),
                          ),
                          Text('Contacto', style: TextStyle(color: Color.fromARGB(118, 60, 60, 67), fontSize: 17,)  ,),
                        ],
                      ),
                      onPressed: () {
                        toggleFormVisibility();
                      },
                    ),
                  ),             
               ),
               //const SizedBox(height: 30,),              
             ],
           ),
         ),
       ),
    );
  }

  onTapUdate(String campo) async {

    if (nameCompany.text.isEmpty || rucCompany.text.isEmpty || addressCompany.text.isEmpty) {
      showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: const Text('Campos Obligatorios'),
            content: const Text('Por favor, llene los campos obligatorios\n Razon social\nRuc\nDireccion Legal'),
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

    //validate if the ruc is 11 digits
    if (rucCompany.text.length < 11) {
      //rucCompany.clear();
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
                },
              ),
            ],
          );
        }
      );
      return;
    }

    dbase.update('company',{
      'id': widget.idCompany,
      'company_name': nameCompany.text,
      'ruc': rucCompany.text,
      'legal_address': addressCompany.text,
      'email': emailCompany.text,
      'web_site': webPageCompany.text,
      'business_activity': activityCompany.text,
      'phone': phoneCompany.text,
    });
    // Show a cupertino dialog to show the user was created
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text('Empresa modificada'),
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