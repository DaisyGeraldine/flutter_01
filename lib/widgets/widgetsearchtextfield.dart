import 'package:flutter/cupertino.dart';
class CSearchTextField extends StatelessWidget {
  const CSearchTextField({super.key, required this.moduleNombre, this.onChanged});
  final String moduleNombre;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        padding: const EdgeInsets.all(0),
        width: 400,
        //color: CupertinoColors.systemPurple,
        child: Column(
          children: <Widget>[
            CupertinoSearchTextField(
              //backgroundColor: CupertinoColors.white,
              placeholder: 'Buscar $moduleNombre',
              //controller: textController,
              onChanged: onChanged,
            )
          ],
        )
      ),
    );
  }
}