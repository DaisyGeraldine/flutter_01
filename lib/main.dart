import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:drawer_views_project/pages/myhome.dart';
import 'package:flutter/material.dart';

void main() {
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;
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