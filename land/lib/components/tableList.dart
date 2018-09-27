import 'package:flutter/material.dart';

Widget getTableList(map) {
  List<TableRow> lists = [];
  map.forEach((key,value){
    lists.add(new TableRow(
      children: [
        new TableCell(
          child: new Padding(
            padding: new EdgeInsets.only(top: 20.0, left: 20.0, bottom: 20.0),
            child: new Text(key, textAlign: TextAlign.start)
          )
        ),
        new TableCell(
          // child:new Text(value, textAlign: TextAlign.start)
          child: new Padding(
            padding: new EdgeInsets.only(top: 20.0, left: 20.0, bottom: 20.0),
            child: new Text(value, textAlign: TextAlign.start)
          )
        )
      ]
    ));
  });
  Widget table =  new Table(
    // border: TableBorder.symmetric(
    //   inside: BorderSide(
    //     color: const Color(0xFF000000),
    //     width: 1.0,
    //     style: BorderStyle.solid,
    //   ),
    //   outside: BorderSide(
    //     color: const Color(0xFF000000),
    //     width: 1.0,
    //     style: BorderStyle.solid,
    //   )
    // ),
    border: TableBorder(
      horizontalInside: BorderSide(
        color: const Color(0xFF000000),
        width: 1.0,
        style: BorderStyle.solid,
      ), 
      // verticalInside: BorderSide(
      //   color: const Color(0xFF000000),
      //   width: 1.0,
      //   style: BorderStyle.solid,
      // ),
      bottom: BorderSide(
        color: const Color(0xFF000000),
        width: 1.0,
        style: BorderStyle.solid,
      )
    ),
    // border: TableBorder.all(
    //   color: const Color(0xFF000000),
    //   width: 1.0,
    //   style: BorderStyle.solid,
    // ),
    children: lists
  );
  return new Padding(
    padding: new EdgeInsets.all(0.0),
    child: table
  );
}