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
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: new Padding(
            padding: new EdgeInsets.only(top: 20.0, left: 20.0, bottom: 20.0,right: 20.0),
            child: new Text(value, textAlign: TextAlign.start)
          )
        )
      ]
    ));
  });
  Widget table =  new Table(
    defaultColumnWidth: const FlexColumnWidth(1.0),
    columnWidths: const {
      0: FlexColumnWidth(2.0),
      1: FlexColumnWidth(3.0), 
      // 2: FlexColumnWidth(3.0),
      // 2: FixedColumnWidth(120.0),
    },
    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
    // border: TableBorder.symmetric(
    //   inside: BorderSide(
    //     color: const Color(0xFFdddddd),
    //     width: 1.0,
    //     style: BorderStyle.solid,
    //   ),
    //   outside: BorderSide(
    //     color: const Color(0xFFdddddd),
    //     width: 1.0,
    //     style: BorderStyle.solid,
    //   )
    // ),
    border: TableBorder(
      horizontalInside: BorderSide(
        color: const Color(0xFFdddddd),
        width: 1.0,
        style: BorderStyle.solid,
      ), 
      // verticalInside: BorderSide(
      //   color: const Color(0xFFdddddd),
      //   width: 1.0,
      //   style: BorderStyle.solid,
      // ),
      bottom: BorderSide(
        color: const Color(0xFFdddddd),
        width: 1.0,
        style: BorderStyle.solid,
      )
    ),
    // border: TableBorder.all(
    //   color: const Color(0xFFdddddd),
    //   width: 1.0,
    //   style: BorderStyle.solid,
    // ),
    children: lists
  );
  
  return new ListView(
    shrinkWrap: true,
    padding: const EdgeInsets.only(bottom: 70.0),
    children: <Widget>[
      table
    ]
  );
}