import 'package:flutter/material.dart';
import 'package:mysql_flutter/home_screen.dart';

void main (){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Tienda",
      home: Home(),
    );
  }
}
