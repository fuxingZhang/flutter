import 'package:flutter/material.dart';
import '../components/zoomable_image.dart';
import '../config/config.dart';

class PicturePage2 extends StatefulWidget {
  PicturePage2({Key key, this.path}) : super(key: key);

  final String path;

  @override
  _PicturePageState createState() => new _PicturePageState(path: path);
}

class _PicturePageState extends State<PicturePage2> {
  _PicturePageState({Key key, this.path});
  final String path;

  ThemeData theme = ThemeData(
    primarySwatch: Colors.blue,
    primaryColor: Color(0xFF468081),
    accentColor: Colors.white
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Photo View',
      theme: theme,
      home: Scaffold(
        appBar: AppBar(
          title: new Row(children:[
            const SizedBox(
              width: 30.0, 
              height: 10.0
            ),
            new Expanded(
                // flex: 1,
                child: new Text('承包地块示意图',
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                    // color: Color(0xFF614120),
                    // fontWeight: FontWeight.bold,
                    fontSize: 20.0
                  ),
                ),
              ),
              // new FlatButton(
              //   textColor: Colors.white,
              //   padding: EdgeInsets.all(0.0),
              //   child: new Text(
              //     '返回', 
              //     textAlign: TextAlign.right,
              //     style: new TextStyle(
              //       fontSize: 20.0,
              //       // color: Colors.white
              //     ),
              //   ),
              //   onPressed: () {
              //     Navigator.of(context).pop();
              //   },
              // ),
              IconButton(
                padding: EdgeInsets.fromLTRB(4.0, 4.0, 4.0, 4.0),
                icon: Icon(const IconData(0xe14c, fontFamily: 'MaterialIcons'),
                  size: 30.0,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
          ]),
        ),
        body: _getBody(path),
      ),
    );
  }
}

Widget _getBody (String path) {
  return new ZoomableImage(
    NetworkImage('${Config['baseUrl']}/v1/api/photo?path=$path'),
    placeholder: const Center(
      child: const CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(
          Color(0xFF468081)
        )
      )
    ),
    backgroundColor: Colors.white
  );
}