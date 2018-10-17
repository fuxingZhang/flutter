import 'package:flutter/material.dart';

Widget getBottomSheet(BuildContext context) {
  return Container(
    height: 70.0,
    width: MediaQuery.of(context).size.width,
    // decoration: BoxDecoration(
    //   border: Border(top: BorderSide(color: Theme.of(context).disabledColor))
    // ),
    child: Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: new Column(
        mainAxisAlignment  :MainAxisAlignment.end,
        children: [
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
        ]
      )
    )
  );
}