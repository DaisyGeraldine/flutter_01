
import 'package:flutter/cupertino.dart';

class ViewCompany extends StatefulWidget {
  const ViewCompany({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ViewCompany createState() => _ViewCompany();
}

class _ViewCompany extends State < ViewCompany >{
  
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
      child: SafeArea(
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
            child: Column(
              children: [
                Container(
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
                                    prefix: const Text('Razón Social:           ', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.bold, fontSize: 17,)),
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
                                  ),
                                  const SizedBox(height: 10,),
                                  CupertinoTextField(
                                    prefix: const Text('RUC:           ', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.bold, fontSize: 17,)),
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
                                  ),
                                  const SizedBox(height: 10,),
                                  CupertinoTextField(
                                    prefix: const Text('Dirección Legal:           ', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.bold, fontSize: 17,)),
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
                                  ),
                                  const SizedBox(height: 10,),
                                  CupertinoTextField(
                                    prefix: const Text('Correo:           ', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.bold, fontSize: 17,)),
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
                            SizedBox(width: 40,),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  CupertinoTextField(
                                    prefix: const Text('Página Web:           ', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.bold, fontSize: 17,)),
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
                                  ),
                                  const SizedBox(height: 20,),
                                  CupertinoTextField(
                                    prefix: const Text('Actividad \n Comercial:           ', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.bold, fontSize: 17,)),
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
                                  ),
                                  const SizedBox(height: 30,),
                                  CupertinoTextField(
                                    prefix: const Text('Teléfono:           ', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.bold, fontSize: 17,)),
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
                SizedBox(height: 20,),
                Container(
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
                  
                  child: Text('Contactos', style: const TextStyle(color: Color.fromARGB(255, 102, 32, 32), fontSize: 20, fontWeight: FontWeight.bold)),
                
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}