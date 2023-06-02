import 'package:drawer_views_project/pages/adduser.dart';
import 'package:flutter/cupertino.dart';

class CButtonSearch extends StatelessWidget {
  const CButtonSearch({super.key, required this.moduleNombre});
  final String moduleNombre;

  @override
  Widget build(BuildContext context) {
    return Align(
      
      alignment: Alignment.topRight,
      child: CupertinoButton.filled(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(CupertinoIcons.add, color: CupertinoColors.white),
            SizedBox(width: 8),
            Text(moduleNombre, style: TextStyle(fontWeight: FontWeight.bold, color: CupertinoColors.white)),

          ],
        ),
   
        onPressed: (){
          Navigator.push(
            context,
            CupertinoPageRoute(builder: (context) => const AddUser()),
          );
        },    
      ), 
    );
  }
}