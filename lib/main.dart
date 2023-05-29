import 'package:drawer_views_project/pages/myhome.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      title: 'Demo',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}