import 'package:flutter/material.dart';

Widget getBackButton(BuildContext context) {
  return IconButton(
    alignment: Alignment(-1.8, 0.0),
    padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
    highlightColor: Color(0xFF468081),
    icon: Icon(const IconData(0xe5e0, fontFamily: 'MaterialIcons', matchTextDirection: true),
      size: 22.0,
    ),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
}
