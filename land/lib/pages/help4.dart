import 'package:flutter/material.dart';
import '../components/bottomSheet.dart';
import '../components/backButtopn.dart';

class Help4 extends StatelessWidget {
  Help4({ Key key }) : super(key: key);

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
  return new ListView(
    shrinkWrap: true,
    padding: const EdgeInsets.only(bottom: 10.0),
    children: <Widget>[
      _getRow(
        '查询结果信息与手持权证不一致?', 
        fontSize: 24.0,
        fontWeight: FontWeight.bold
      ),
      _getRow(
        '身份验证成功，浏览到查询结果信息，但与手持的权证信息不符。不符的情况可能因为：',
      ),
      _getRow(
        '１.数据库信息版本为旧版本数据，数据库尚未更新，导致与最新的手持权证信息不一致，查询结果以最新汇交入库时间为准（查询结果页面有提示）；',
      ),
      _getRow(
        '２.数据库登记汇交数据的质量问题，该情况可向当地农经部门反映和询问', 
      ),
    ]
  );
}

Widget _getRow(String text, {double fontSize: 16.0, FontWeight fontWeight: FontWeight.normal}) {
  return new Padding(
    padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 16.0),
    child: Text(text, style: TextStyle(
      fontSize: fontSize,
      height: 1.4,
      fontWeight: fontWeight
    )),
  );
}