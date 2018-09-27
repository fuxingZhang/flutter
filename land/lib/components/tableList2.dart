import 'package:flutter/material.dart';

Widget getTableList(map) {
  List<Widget> lists = [];
  map.forEach((key,value){
    lists.add(
      new Padding(
        padding: new EdgeInsets.only(top: 20.0),
        child: new Row(
        children: [
          new Expanded(
            flex: 2,
            child: new Text(key, textAlign: TextAlign.start),
          ),
          new Expanded(
            flex: 3,
            child: new Text(value, textAlign: TextAlign.start),
          ),
        ]
      )
      )
    );
  });
  return new Padding(
    padding: new EdgeInsets.only(top: 20.0, left: 30.0, right: 30.0),
    child: new Column(
      children: lists
    )
  );
}