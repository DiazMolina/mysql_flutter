import 'package:flutter/material.dart';
import 'package:mysql_flutter/edit_data.dart';
import 'package:mysql_flutter/funciones.dart';
import 'package:mysql_flutter/home_screen.dart';

class Detail extends StatefulWidget {
  List list;
  int index;
  Detail({this.list,this.index});
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  void _confirm(){
    AlertDialog alertDialog =new AlertDialog(
      content: new Text("estas Seguro de Eliminar ${widget.list[widget.index]['item_name']}"),
      actions: <Widget>[
        new RaisedButton(

          child: new Text(" Ok Delete",style: TextStyle(color: Colors.black),),
            color: Colors.red,
            onPressed: () {
              deleteData(widget.list[widget.index]['id']);
              Navigator.of(context).push(
                new MaterialPageRoute(builder: (BuildContext context)=> new Home())
              );
            }),
        new RaisedButton(
            child: new Text(" Cancel",style: TextStyle(color: Colors.black),),
            color: Colors.green,
            onPressed: ()=> Navigator.pop(context)),
      ],
    );
    showDialog(context: context,
    child: alertDialog);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("${widget.list[widget.index]['item_name']}"),
      ),
      body:  new Container(
        height: 250,
        padding: const EdgeInsets.all(20.0),
        child: new Card(
          child: new Center(
            child: new Column(
              children: <Widget>[
                new Padding(padding: const EdgeInsets.only(top: 30.0)),
                new Text("${widget.list[widget.index]['item_name']}",style: new TextStyle(fontSize: 20.0)),
                new Text("Code: ${widget.list[widget.index]['item_code']}",style: new TextStyle(fontSize: 18.0)),
                new Text("Price: ${widget.list[widget.index]['price']}",style: new TextStyle(fontSize: 18.0)),
                new Text("Stock: ${widget.list[widget.index]['stock']}",style: new TextStyle(fontSize: 18.0)),
                new Padding(padding: const EdgeInsets.only(top: 30.0)),
                new Row(

                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    new RaisedButton(
                        child: new Text("Edit"),
                      color: Colors.green,
                      onPressed: ()=>Navigator.of(context).push(
                        new MaterialPageRoute(builder: (BuildContext context)=> new EditData(list: widget.list,index: widget.index,)),
                      ),
                        ),
                    new RaisedButton(
                      child: new Text("Delete"),
                      color: Colors.red,
                      onPressed: ()=>_confirm(),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
