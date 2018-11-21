import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mysql_flutter/add_data.dart';
import 'package:mysql_flutter/funciones.dart';
import 'package:mysql_flutter/item_list.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<List> getData()async{
    final response = await http.get("http://10.0.3.2/flutter_mysql/getdata.php");
    return json.decode(response.body);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Mi Tienda"),
      ),
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.add),
        onPressed: ()=>Navigator.of(context).push(new MaterialPageRoute(
            builder: (BuildContext context)=> new AddData()
        )),
      ),
      body: new FutureBuilder<List>(
        future: getData(),
        builder: (context,snapshot){
          if(snapshot.hasError)print(snapshot.error);
          return snapshot.hasData? new ItemList(list:snapshot.data): new Center(
            child: new CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}


