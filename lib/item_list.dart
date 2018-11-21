import 'package:flutter/material.dart';
import 'package:mysql_flutter/detail_screen.dart';

class ItemList extends StatelessWidget {
  List list;
  ItemList({this.list});
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: list == null ? 0 : list.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(10.0),
            child: new GestureDetector(
                onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => new Detail(list: list,index: index,))),
                child: new Card(
                  child: new Column(
                    children: <Widget>[
                      ListTile(
                        title: new Text(list[index]['item_name']),
                        leading: new Icon(Icons.widgets),
                        subtitle: new Text("stock: ${list[index]['stock']}"),
                      )
                    ],
                  ),
                )),
          );
        });
  }
}
