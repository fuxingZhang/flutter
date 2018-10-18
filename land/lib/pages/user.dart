import 'package:flutter/material.dart';
import '../components/tableList.dart';
import '../components/family.dart';
import '../components/land.dart';
import '../components/bottomSheet.dart';

class User extends StatefulWidget {
  User({Key key, this.data}) : super(key: key);
  final data;

  @override
  _UserPageState createState() => new _UserPageState(data: this.data);
}

class _UserPageState extends State<User> {
  _UserPageState({Key key, this.data});
  final data;

  @override
  Widget build(BuildContext context) {
    final grantDateTime = DateTime.parse(data['CBJYQZ']['FZRQ']).toLocal();
    final grantDate = '${grantDateTime.year}-${grantDateTime.month}-${grantDateTime.day}';
    final fromDateTime = DateTime.parse(data['CBJYQZDJB']['CBQXQ']).toLocal();
    final fromDate = '${fromDateTime.year}-${fromDateTime.month}-${fromDateTime.day}';
    final toDateTime = DateTime.parse(data['CBJYQZDJB']['CBQXZ']).toLocal();
    final toDate = '${toDateTime.year}-${toDateTime.month}-${toDateTime.day}';

    return MaterialApp(
      title: '用户信息页',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Color(0xFF468081),
        accentColor: Colors.white
      ),
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            elevation: 4.0,
            title: new Row(children:[
            IconButton(
              alignment: Alignment(-1.8, 0.0),
              padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
              icon: Icon(
                const IconData(0xe5e0, fontFamily: 'MaterialIcons', matchTextDirection: true),
                // size: 22.0,
              ),
              iconSize: 10.0,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            new Expanded(
              // flex: 1,
              child: new Text('国家级农村土地承包经营权公众查询系统',
                textAlign: TextAlign.center,
                style: new TextStyle(
                  // color: Color(0xFF614120),
                  // fontWeight: FontWeight.bold,
                  fontSize: 20.0
                ),
              ),
            ),]),
            // iconTheme: Theme.of(context).iconTheme,
            // brightness: Brightness.light,
            // flexibleSpace: Container(
            //   decoration: BoxDecoration(
            //     border: Border(
            //       bottom: BorderSide(color: Theme.of(context).dividerColor)
            //     )
            //   )
            // ),
            bottom: TabBar(
              isScrollable: true,
              tabs: [
                Tab(text: '承包信息'),
                Tab(text: '家庭成员'),
                Tab(text: '地块信息'),
                Tab(text: '权证信息'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              getTableList({
                '承包经营权证代码': data['CBJYQZDJB']['CBJYQZBM'],
                '承包方代表': data['CBF']['CBFMC'],
                '发包方全称': data['FBF']['FBFMC'],
                '合同代码': data['CBHT']['CBHTBM'],
                '承包期限': '$fromDate 至 $toDate',
              }),
              getFamily(data['CBF_JTCY']),
              getLand(context, data['DK'], data['CBJYQZDJB']['DKSYT']),
              getTableList({
                '权证流水号': data['CBJYQZDJB']['CBJYQZLSH'],
                '发证日期': grantDate,
                '领取人姓名': data['CBJYQZ']['QZLQRXM'],
                '发证机关': data['CBJYQZ']['FZJG'],
                '领取人证件号': data['CBJYQZ']['QZLQRZJHM'],
                '权证是否领取': data['CBJYQZ']['QZSFLQ'] == '1' ? '是' : '否',
              })
            ],
          ),
          bottomSheet: getBottomSheet(context, withUserGuide: true)
        ),
      ),
    );
  }
}
