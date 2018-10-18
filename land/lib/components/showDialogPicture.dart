import 'package:flutter/material.dart';
import './photoView/photo_view.dart';
import '../config/config.dart';

Future<Null> showPicture(BuildContext context, String path) async {
  return showDialog<Null>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return new AlertDialog(
        title: Container(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          color: Color(0xFFEBDDBD),
          child: new Row(
            children:[
              const SizedBox(
                width: 40.0,
                height: 10.0
              ),
              // new Opacity(opacity: 0.0, 
              //   child: IconButton(
              //     padding: EdgeInsets.all(8.0),
              //     icon: Icon(const IconData(0xe14c, fontFamily: 'MaterialIcons')),
              //     onPressed: () {
              //       Navigator.of(context).pop();
              //     },
              //   )
              // ),
              new Expanded(
                // flex: 1,
                child: new Text('承包地块示意图',
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                    color: Color(0xFF614120),
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0
                  ),
                ),
              ),
              IconButton(
                padding: EdgeInsets.fromLTRB(4.0, 4.0, 4.0, 4.0),
                icon: Icon(const IconData(0xe14c, fontFamily: 'MaterialIcons'),
                  size: 30.0,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ]
          )
        ),
        titlePadding: EdgeInsets.all(0.0),
        content: Container(
          // symmetric 上下margin,horizontal 水平，也就是左右
          // EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 24.0) 从左、上、右、下
          margin: const EdgeInsets.all( 0.0),
          padding: const EdgeInsets.all( 0.0),
          height: 240.0,
          width: 600.0,
          // color: Color(0xFFEBDDBD),
          child: 
            PhotoViewInline(
            // PhotoView(
              backgroundColor: Colors.white,
              imageProvider: NetworkImage('${Config['baseUrl']}/v1/api/photo?path=$path'),
            )
            // new ZoomableImage(
            //   NetworkImage('${Config['baseUrl']}/v1/api/photo?path=$path'),
            //   backgroundColor: Colors.white,
            //   placeholder: const Center(
            //     child: const CircularProgressIndicator(
            //       valueColor: AlwaysStoppedAnimation(
            //         Color(0xFF468081)
            //       )
            //     )
            //   ),
            // )
        ),
        contentPadding: EdgeInsets.all(0.0),
        actions: <Widget>[
          // new FlatButton(
          //   child: new Text(
          //     '关闭', 
          //     style: new TextStyle(
          //       fontSize: 18.0
          //     ),
          //   ),
          //   onPressed: () {
          //     Navigator.of(context).pop();
          //   },
          // ),
        ],
      );
    },
  );
}