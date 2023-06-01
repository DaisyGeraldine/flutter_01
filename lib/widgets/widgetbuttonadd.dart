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
        
        child: Text(moduleNombre), 
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