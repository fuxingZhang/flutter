import 'package:flutter/material.dart';
import 'package:amap_location/amap_location.dart';
import 'package:simple_permissions/simple_permissions.dart';
import 'package:easy_alert/easy_alert.dart';

void main() => runApp(MyApp());

// void main() => runApp(
//   /*============*/
//   //设置ios的key
//   /*=============*/
//   // AMapLocationClient.setApiKey("fd0244482d6364dac0510dfac228798e");
//   /*============*/
//   //设置ios的key
//   /*=============*/
//   new MyApp()
// );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  AMapLocation _loc;

  @override
  void initState() {
    AMapLocationClient.startup(new AMapLocationOption( desiredAccuracy:CLLocationAccuracy.kCLLocationAccuracyHundredMeters  ));
    super.initState();
  }

  @override
  void dispose() {
    //注意这里关闭
    AMapLocationClient.shutdown();
    super.dispose();
  }

  void _checkPersmission() async{
    bool hasPermission = await SimplePermissions.checkPermission(Permission.WhenInUseLocation);
    if(!hasPermission){
      final requestPermissionResult = await SimplePermissions.requestPermission(Permission.WhenInUseLocation);
      if(requestPermissionResult != PermissionStatus.authorized){
        Alert.alert(context,title: "申请定位权限失败");
        return;
      }
    }
    AMapLocation loc = await AMapLocationClient.getLocation(true);

    setState(() {
      _loc = loc;
    });
  }

  List<Widget> _getWidgets () {
    List<Widget> widgets = [];

    if(_loc != null) {
      widgets.add(Text('description: ${_loc.description}'));
      widgets.add(Text('timestamp: ${_loc.timestamp}'));
      widgets.add(Text('code: ${_loc.code}'));
      widgets.add(Text('altitude: ${_loc.altitude}'));
      widgets.add(Text('speed: ${_loc.speed}'));
      widgets.add(Text('longitude: ${_loc.longitude}'));
      widgets.add(Text('latitude: ${_loc.latitude}'));
      widgets.add(Text('accuracy: ${_loc.accuracy}'));
      widgets.add(Text('adcode: ${_loc.adcode}'));
      widgets.add(Text('citycode: ${_loc.citycode}'));
      widgets.add(Text('country: ${_loc.country}'));
      widgets.add(Text('city: ${_loc.city}'));
      widgets.add(Text('district: ${_loc.district}'));
      widgets.add(Text('formattedAddress: ${_loc.formattedAddress}'));
      widgets.add(Text('number: ${_loc.number}'));
      widgets.add(Text('provider: ${_loc.provider}'));
      widgets.add(Text('province: ${_loc.province}'));
      widgets.add(Text('street: ${_loc.street}'));
      widgets.add(Text('locationType: ${_loc.locationType}'));
      widgets.add(Text('success: ${_loc.success}'));
    }

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _getWidgets(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _checkPersmission,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
