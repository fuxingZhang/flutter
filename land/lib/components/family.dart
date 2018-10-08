import 'package:flutter/material.dart';

Widget getFamily(list) {
  // List<Widget> lists = [];
  // list.forEach((item){
  //   List<Widget> row = [];
  //   var i = 0;
  //   item.forEach((v){
  //     i++;
  //     final flex = i == 2 || i == 3 ? 2 : 1;
  //     row.add(new Expanded(
  //       flex: flex,
  //       child: new Text(v, textAlign: TextAlign.start),
  //     ));
  //   });
  //   lists.add(
  //     new Padding(
  //       padding: new EdgeInsets.only(top: 20.0),
  //       child: new Row(
  //         children: row
  //       )
  //     )
  //   );
  // });
  // return new Padding(
  //   padding: new EdgeInsets.only(top: 20.0, left: 30.0, right: 30.0),
  //   child: new Column(
  //     children: lists
  //   )
  // );
  List<TableRow> lists = [];
  int i = 0;
  list.forEach((item){
    List<TableCell> children = [];
    item.forEach((v){
      children.add(new TableCell(
        child: new Padding(
          padding: new EdgeInsets.only(top: 20.0, left: 20.0, bottom: 20.0),
          child: new Text(v, textAlign: TextAlign.start)
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