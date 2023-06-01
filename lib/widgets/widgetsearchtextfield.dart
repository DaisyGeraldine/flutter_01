import 'package:flutter/cupertino.dart';

class CSearchTextField extends StatelessWidget {
  const CSearchTextField({super.key, required this.moduleNombre});
  final String moduleNombre;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        padding: const EdgeInsets.all(0),
        width: 500,
        //color: CupertinoColors.systemPurple,
        child: Column(
          children: <Widget>[
            CupertinoSearchTextField(
              //backgroundColor: CupertinoColors.white,
              placeholder: 'Buscar $moduleNombre',)
          ],
        )
      ),
    );
  }
}