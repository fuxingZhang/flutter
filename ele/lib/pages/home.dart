import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
 MyHomePage({Key key}) : super(key: key);

 @override
 _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 int _selectedIndex = 0;
 final _widgetOptions = [
   Text('Index 0: 首页'),
   Text('Index 1: 发现'),
   Text('Index 2: 订单'),
   Text('Index 3: 我的'),
 ];

 @override
 Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text('ele'),
     ),
     body: Center(
       child: _widgetOptions.elementAt(_selectedIndex),
     ),
     bottomNavigationBar: BottomNavigationBar(
       items: <BottomNavigationBarItem>[
         BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
         BottomNavigationBarItem(icon: Icon(Icons.business), title: Text('发现')),
         BottomNavigationBarItem(icon: Icon(Icons.school), title: Text('订单')),
         BottomNavigationBarItem(icon: Icon(Icons.add_alarm), title: Text('我的')),
       ],
       currentIndex: _selectedIndex,
       fixedColor: Colors.blue,
       type: BottomNavigationBarType.fixed,
       onTap: _onItemTapped,
     ),
   );
 }

 void _onItemTapped(int index) {
   setState(() {
     _selectedIndex = index;
   });
 }
}