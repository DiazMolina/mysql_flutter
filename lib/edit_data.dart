import 'package:flutter/material.dart';
import 'package:mysql_flutter/home_screen.dart';
import 'funciones.dart';
class EditData extends StatefulWidget {
  final  List list;
  final int index;
  EditData({this.list,this.index});
  @override
  _EditDataState createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {

  TextEditingController controllerCode ;
  TextEditingController controllerName;
  TextEditingController controllerPrice;
  TextEditingController controllerStock;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controllerCode = new TextEditingController(text: widget.list[widget.index]['item_code']);
    controllerName = new TextEditingController(text: widget.list[widget.index]['item_name']);
    controllerPrice = new TextEditingController(text: widget.list[widget.index]['price']);
    controllerStock = new TextEditingController(text: widget.list[widget.index]['stock']);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("EDIT DATA"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new TextField(
                  controller: controllerCode,
                  decoration: new InputDecoration(
                      hintText: "Item Code",
                      labelText: "Item Code"
                  ),
                ),
                new TextField(
                  controller: controllerName,
                  decoration: new InputDecoration(
                      hintText: "Item Name",
                      labelText: "Item Name"
                  ),
                ),
                new TextField(
                  controller: controllerPrice,
                  decoration: new InputDecoration(
                      hintText: "Price",
                      labelText: "Price"
                  ),
                ),
                new TextField(
                  controller: controllerStock,
                  decoration: new InputDecoration(
                      hintText: "Stock",
                      labelText: "Stock"
                  ),
                ),
                new Padding(padding: const EdgeInsets.all(10.0)),
                new RaisedButton(
                    child: new Text("EDIT DATA"),
                    color: Colors.blueAccent,
                    onPressed: (){UpdateData(widget.list[widget.index]['id'],controllerStock,controllerPrice,controllerName,controllerCode);
                    Navigator.of(context).push(
                        new MaterialPageRoute(builder: (BuildContext context)=> new Home())
                    );
                    })
              ],
            ),
          ],
        ),
      ),
    );
  }
}
