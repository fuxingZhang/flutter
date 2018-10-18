import 'package:flutter/material.dart';

Widget getBottomSheet(BuildContext context, {bool withUserGuide: false}) {
  final List<Widget> children = [];
  double height = 65.0;
  final userGuide = new Padding(
    padding: EdgeInsets.only(bottom: 5.0),
    child: GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('/userGuide');
      },
      child: Text('用户指南',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18.0,
          height: 1.0,
          color: Color(0xFF715B45)
        )
      )
    )
  );

  if(withUserGuide) {
    children.add(userGuide);
    height = 90.0;
  }

  children.addAll([
    Text('农业农村部农村经济体制与经营管理司',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Color(0xFF9E9E9E),
        fontSize: 14.0
      )
    ),
    Text('农业农村部规划设计研究院   版权所有',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Color(0xFF9E9E9E),
        fontSize: 14.0
      )
    ),
  ]);

  return Container(
    height: height,
    width: MediaQuery.of(context).size.width,
    // decoration: BoxDecoration(
    //   border: Border(top: BorderSide(color: Theme.of(context).disabledColor))
    // ),
    child: Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: children
      )
    )
  );
}