import 'package:flutter/material.dart';

Widget getLand(BuildContext context,List list, String path) {
  List<TableRow> lists = [];
  List<List> arr = [['序号','地块代码','地块四至(东至、西至、南至、北至)','面积(亩)','是否基本农田','备注']];
  int i = 0;
  int length = list.length;
  double size = 0.0;
  list.forEach((item){
    arr.add([
      (i++).toString(),
      item['DKBM'],
      '东至:${item['DKDZ']},西至:${item['DKXZ']},南至:${item['DKNZ']},北至:${item['DKBZ']}',
      item['HTMJM'].toStringAsFixed(2),
      item['SFJBNT'] == '1' ? '是' : '否',
      item['DKBZXX'],
    ]);
    size += item['HTMJM'];
  });
  i = 0;
  arr.forEach((item) {
    Color backgroundColor;
    if(i == 0) {
      backgroundColor = new Color(0xFFEDE6D2);
    } else if (i%2 == 0) {
      backgroundColor = new Color(0xFFF8F8F8);
    } else {
      backgroundColor = new Color(0xFFFFFFFF);
    }
    i++;
    lists.add(new TableRow(
      decoration: new BoxDecoration(
        color: backgroundColor,
        // border: new Border.all(color: Colors.yellow, width: 5.0,),
        // borderRadius: new BorderRadius.all(new Radius.circular(50.0)),
        // 线性渐变
        // gradient: new LinearGradient(colors: [Colors.blue, Colors.green]),
      ),
      children: [
        _getTableCell(item[0]),
        _getTableCell(item[1]),
        _getTableCell(item[2]),
        _getTableCell(item[3]),
        _getTableCell(item[4]),
        _getTableCell(item[5]),
      ]
    ));
  });
  Widget table =  new Table(
    defaultColumnWidth: const FlexColumnWidth(1.0),
    columnWidths: const {
      // 0: FixedColumnWidth(50.0),
      1: FlexColumnWidth(2.0),     // flex 宽度
      2: FlexColumnWidth(3.0),
      // 2: FixedColumnWidth(120.0),  // 固定宽度
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
  return new ListView(
    shrinkWrap: true,
    padding: const EdgeInsets.only(bottom: 70.0),
    children: <Widget>[
      SizedBox(height: 4.0,),
      _getTop(['承包地确权总面积(亩)', size.toStringAsFixed(2),'承包地总数(块)', length.toString()]),
      _getButton(context, path),
      table
    ],
  );
}

Future<Null> _showPicture(BuildContext context, String path) async {
  return showDialog<Null>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return new AlertDialog(
        title: new Text('承包地块示意图',style: new TextStyle(
            color: Color(0xFF614120),
          ),
        ),
        content: new SingleChildScrollView(
          child: new ListBody(
            children: <Widget>[
              Image.network('https://www.gisstack.xyz/v1/api/photo?path=$path', height: 200.0),
            ],
          ),
        ),
        actions: <Widget>[
          new FlatButton(
            child: new Text(
              '确定', 
              style: new TextStyle(
                fontSize: 18.0
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

Table _getTop(List list) {
  List<TableCell> lists = [];
  // Iterable<TableCell> cells = list.map((item) => _getTableCell(item));
  // lists.addAll(cells);
  lists.addAll(list.map((item) => _getTableCell(item)));
  print(lists);

  return new Table(
    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
    defaultColumnWidth: const FlexColumnWidth(1.0),
    columnWidths: const {
      0: FlexColumnWidth(3.0),
      1: FixedColumnWidth(50.0),
      2: FlexColumnWidth(2.0),
      3: FixedColumnWidth(50.0),
    },
    border: TableBorder.all(
      color: const Color(0xFFdddddd),
      width: 1.0,
      style: BorderStyle.solid,
    ),
    children: [
      new TableRow(
        children: lists
      ),
    ]
  );
}

TableCell _getTableCell(String text) {
  return new TableCell(
    verticalAlignment: TableCellVerticalAlignment.middle,
    child: new Padding(
      padding: new EdgeInsets.only(top: 10.0, left: 0.0, bottom: 10.0),
      child: new Text(text, textAlign: TextAlign.center)
    )
  );
}

Container _getButton(BuildContext context, String path) {
  return new Container(
    margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
    padding: new EdgeInsets.only(left: 20.0, right: 20.0),
    child:  RaisedButton(
      color: Color(0xFF8CA315),
      padding: new EdgeInsets.only(top: 10.0, bottom: 10.0),
      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(8.0)),
      onPressed: (){
        _showPicture(context, path);
      },
      child: new Text(
        '查看地块示意图',
        style: new TextStyle(
          // fontWeight: FontWeight.bold, 
          fontSize: 16.0,
          color: Color(0xFFffffff)
        )
      ),
    ),
  );
}