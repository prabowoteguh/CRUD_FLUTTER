import 'package:flutter/material.dart';
import 'package:crud_mahasiswa/view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      debugShowCheckedModeBanner: false,
      title: "CRUDs",
      home: Home(),
    );
  }
}
