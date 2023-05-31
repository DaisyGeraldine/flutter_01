import 'package:drawer_views_project/pages/adduser.dart';
import 'package:flutter/cupertino.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _UsersPage createState() => _UsersPage();
}

class _UsersPage extends State < UsersPage >{
  
  @override
  Widget build(BuildContext context){
     return const AddUser();
  }
}