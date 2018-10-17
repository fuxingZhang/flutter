import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/userGuide.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Color(0xFF468081),
        accentColor: Colors.black
      ),
      home: new MyHomePage(title: '国家级农村土地承包经营权公众查询系统'),
      routes: <String, WidgetBuilder>{
        '/userGuide': (BuildContext context) => new UserGuide(),
      }
    );
  }
}

