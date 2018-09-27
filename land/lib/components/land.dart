import 'package:flutter/material.dart';

Widget getLand(list) {
  List<TableRow> lists = [];
  for(var i = 0;i < list.length;i++){
    final item = list[i];
    lists.add(new TableRow(
      children: [
        new TableCell(
          child: new Padding(
            padding: new EdgeInsets.only(top: 10.0, left: 10.0, bottom: 10.0),
            child: new Text((i+1).toString(), textAlign: TextAlign.start)
          )
        ),
        new TableCell(
          child: new Padding(
            padding: new EdgeInsets.only(top: 10.0, left: 10.0, bottom: 10.0),
            child: new Text(item['DKBM'], textAlign: TextAlign.start)
          )
        ),
        new TableCell(
          // child:new Text(value, textAlign: TextAlign.start)
          child: new Padding(
            padding: new EdgeInsets.only(top: 10.0, left: 10.0, bottom: 10.0),
            child: new Text(item['HTMJM'].toString(), textAlign: TextAlign.start)
          )
        ),
        // new TableCell(
        //   // child:new Text(value, textAlign: TextAlign.start)
        //   child: new Padding(
        //     padding: new EdgeInsets.only(top: 10.0, left: 10.0, bottom: 10.0),
        //     child: new Column(
        //       children: [
        //         new Text(item['DKDZ'], textAlign: TextAlign.start),
        //         new Text(item['DKXZ'], textAlign: TextAlign.start),
        //         new Text(item['DKNZ'], textAlign: TextAlign.start),
        //         new Text(item['DKBZ'], textAlign: TextAlign.start),
        //       ]
        //     )
        //   )
        // ),
        new TableCell(
          // child:new Text(value, textAlign: TextAlign.start)
          child: new Padding(
            padding: new EdgeInsets.only(top: 10.0, left: 10.0, bottom: 10.0),
            child: new Text(item['SFJBNT'], textAlign: TextAlign.start)
          )
        ),
        new TableCell(
          // child:new Text(value, textAlign: TextAlign.start)
          child: new Padding(
            padding: new EdgeInsets.only(top: 10.0, left: 10.0, bottom: 10.0),
            child: new Text(item['DKBZXX'], textAlign: TextAlign.start)
          )
        )
      ]
    ));
  }
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