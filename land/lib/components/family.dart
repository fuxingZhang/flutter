import 'package:flutter/material.dart';

Widget getFamily(list) {
  List<TableRow> lists = [];
  int i = 0;
  list.forEach((item){
    List<TableCell> children = [];
    item.forEach((v){
      children.add(new TableCell(
        verticalAlignment: TableCellVerticalAlignment.middle,
        child: new Padding(
          padding: new EdgeInsets.only(top: 20.0, left: 0.0, bottom: 20.0),
          child: new Text(v, textAlign: TextAlign.center)
        )
      ));
    });
    lists.add(new TableRow(
      decoration: i++ != 0 ? null : new BoxDecoration(
        color: const Color(0xFFEDE6D2),
        // border: new Border.all(color: Colors.yellow, width: 5.0,),
        // borderRadius: new BorderRadius.all(new Radius.circular(50.0)),
        // 线性渐变
        // gradient: new LinearGradient(colors: [Colors.blue, Colors.green]),
      ),
      children: children
    ));
  });
  Widget table =  new Table(
    defaultColumnWidth: const FlexColumnWidth(1.0),
    // columnWidths: const {
    //   0: FixedColumnWidth(50.0),
    //   1: FixedColumnWidth(100.0),
    //   2: FixedColumnWidth(50.0),
    //   3: FixedColumnWidth(100.0),
    // },
    columnWidths: const {
      // 0: FlexColumnWidth(1.0),
      1: FlexColumnWidth(2.0),     // flex 宽度
      2: FlexColumnWidth(2.0),
      // 2: FixedColumnWidth(120.0),  // 固定宽带
      // 3: FlexColumnWidth(1.0),
    },
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
  return new Padding(
    padding: new EdgeInsets.all(0.0),
    child: table
  );
}