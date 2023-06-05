import 'package:flutter/cupertino.dart';

class ViewUser extends StatelessWidget {
  const ViewUser({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Mi perfil', style: TextStyle(color: CupertinoColors.white)),
        backgroundColor: Color.fromARGB(255, 0, 90, 193), 
        ),
      child: SafeArea(
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
                      image: DecorationImage(
                          image: AssetImage('assets/images/icono_usuario.png'),
                          fit: BoxFit.cover),
                      color: Color.fromARGB(255, 44, 44, 128)),
                  //child: Image.asset('assets/images/icono_usuario.png', width: 200, height: 200,),
              ),
              
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            child: Column(
                              children: [
                                const Text(
                                  'Nombre',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: CupertinoColors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                CupertinoTextFormFieldRow(
                                  placeholder: 'Nombre',
                                  padding: const EdgeInsets.all(0),
                                  style: const TextStyle(
                                    color: CupertinoColors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                  decoration: const BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                              color: Color.fromARGB(102,102,102, 102),
                                              width: 0.3),
                                        ),
                                  ),                         
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                const Text(
                                'Dni',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: CupertinoColors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                CupertinoTextFormFieldRow(
                                  placeholder: 'Dni',
                                  padding: const EdgeInsets.all(0),
                                  style: const TextStyle(
                                    color: CupertinoColors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                  decoration: const BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                              color: Color.fromARGB(102,102,102, 102),
                                              width: 0.3
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
                    Expanded(
                      child: Column(
                        children: [
                          const Text(
                            'Cargo',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: CupertinoColors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          CupertinoTextFormFieldRow(
                            placeholder: 'Cargo',
                            padding: const EdgeInsets.all(0),
                            style: const TextStyle(
                              color: CupertinoColors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                            decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                        color: Color.fromARGB(102,102,102, 102),
                                        width: 0.3),
                                  ),
                            ),                         
                          ),
                        ],
                      ),
                    ),
                  ]
                ),
              ),
            ],
          ),
        ),
      ),   
    );
  }
}