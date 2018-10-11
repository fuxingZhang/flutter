import 'package:flutter/material.dart';

Widget getFamily(list) {
  List<Widget> lists = [];
  list.forEach((item){
    List<Widget> row = [];
    int i = 0;
    item.forEach((v){
      i++;
      final flex = i == 2 || i == 3 ? 2 : 1;
      row.add(new Expanded(
        flex: flex,
        child: new Text(v, textAlign: TextAlign.start),
      ));
    });
    lists.add(
      new Padding(
        padding: new EdgeInsets.only(top: 20.0),
        child: new Row(
          children: row
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