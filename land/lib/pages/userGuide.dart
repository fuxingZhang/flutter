import 'package:flutter/material.dart';
import '../components/bottomSheet.dart';
import '../components/backButtopn.dart';

class UserGuide extends StatelessWidget {
  UserGuide({Key key, this.path}) : super(key: key);

  final String path;

  final ThemeData theme = ThemeData(
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
          centerTitle: true,
          title: new Row(children:[
            getBackButton(context),
            new Expanded(
              // flex: 1,
              child: new Text('用户指南',
                textAlign: TextAlign.center,
                style: new TextStyle(
                  // color: Color(0xFF614120),
                  // fontWeight: FontWeight.bold,
                  fontSize: 20.0
                ),
              ),
            ),
            const SizedBox(
              width: 38.0, 
              height: 10.0
            ),
          ]),
        ),
        body: _getBody(context),
        bottomSheet: getBottomSheet(context)
      ),
    );
  }
}

Widget _getBody (BuildContext context) {
  final String text =  '''
尊敬的用户，您好！ 
欢迎使用国家级农村土地承包经营权公众查询系统！
为方便您对系统的使用，我们将您使用过程中可能遇到的任何疑问或问题都进行解疑，请浏览以下指南。''';

  return new ListView(
    shrinkWrap: true,
    padding: const EdgeInsets.only(bottom: 10.0),
    children: <Widget>[
      new Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
        child: Text(text, style: TextStyle(
          fontSize: 16.0,
          height: 1.4
        )),
      ),
      new Container(
        decoration: new BoxDecoration(
          border: new Border( 
            top: BorderSide(
              color: const Color(0XFFECECEC),
              width: 4.0,
            ),
          ),
        ),
      ),
      _getRow(context, 1, '怎样访问系统？', '/help4'),
      _getRow(context, 2, '怎样查询权证信息？', '/help4'),
      _getRow(context, 3, '浏览查询结果？', '/help4'),
      _getRow(context, 4, '检查结果信息与手持权证不一致？', '/help4')
    ]
  );
}

Widget _getRow(BuildContext context, int n, String text, String path) {
  return new Container(
    padding: EdgeInsets.all(12.0),
    decoration: new BoxDecoration(
      border: new Border( 
        bottom: BorderSide(
          color: const Color(0XFFECECEC),
          width: 1.0,
        ),
      ),
    ),
    child: new Row(
      children: [
        new Container(
          height: 26.0,
          width: 26.0,
          margin: EdgeInsets.only(right: 10.0),
          padding: EdgeInsets.only(top: 2.0),
          decoration: new BoxDecoration(
            color: Color(0XFFae7e0a),
            borderRadius: new BorderRadius.circular(80.0),
            // border: new Border( 
            //   bottom: BorderSide(
            //     color: const Color(0XFFECECEC),
            //     width: 1.0,
            //   ),
            // ),
          ),
          child: Text(n.toString(), 
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.bold
            ),
          )
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(path);
          },
          child: Text(text,
            style: TextStyle(
              fontSize: 18.0,
              height: 1.0,
              color: Color(0XFF2f5496)
            )
          )
        )
      ]
    )
  );
}