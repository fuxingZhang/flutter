import 'package:flutter/material.dart';
import '../config/remark.dart';
import '../config/relation.dart';

Widget getFamily(List data) {
  List<List> list = [['序号','姓名','与承包方关系','备注']];
  int i=1;
  data.forEach((item) {
    list.add([
      (i++).toString(),
      item['CYXM'],
      Relation[item['YHZGX']],
      Remark[item['CYBZ']],
    ]);
  });
  List<TableRow> lists = [];
  i = 0;
  lists.addAll(list.map((item){
    List<TableCell> children = [];
    children.addAll(item.map((v) => _getTableCell(v)));
    
    return new TableRow(
      decoration: i++ != 0 ? null : new BoxDecoration(
        color: const Color(0xFFEDE6D2),
        // border: new Border.all(color: Colors.yellow, width: 5.0,),
        // borderRadius: new BorderRadius.all(new Radius.circular(50.0)),
        // 线性渐变
        // gradient: new LinearGradient(colors: [Colors.blue, Colors.green]),
      ),
      children: children
    );
  }));
  Widget table =  new Table(
    defaultColumnWidth: const FlexColumnWidth(1.0),
    columnWidths: const {
      // 0: FlexColumnWidth(1.0),
      1: FlexColumnWidth(2.0),
      2: FlexColumnWidth(3.0),
      // 2: FixedColumnWidth(120.0),
      3: FlexColumnWidth(2.0),
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
  return new ListView(
    shrinkWrap: true,
    padding: const EdgeInsets.only(bottom: 70.0),
    children: <Widget>[
      table
    ]
  );
}

TableCell _getTableCell(String text) {
  return new TableCell(
    verticalAlignment: TableCellVerticalAlignment.middle,
    child: new Padding(
      padding: new EdgeInsets.only(top: 20.0, left: 0.0, bottom: 20.0),
      child: new Text(text, textAlign: TextAlign.center)
    )
  );
}