import 'package:flutter/material.dart';
import '../components/tableList.dart';
import '../components/family.dart';
import '../components/land.dart';

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
    List list = [['序号','姓名','与承包方关系','备注']];
    List jtcy = data['CBF_JTCY'];
    for(var i = 0;i < jtcy.length;i++){
      final item = jtcy[i];
      list.add([
        (i+1).toString(),
        item['CYXM'],
        item['YHZGX'],
        item['CYBZ'],
      ]);
    };

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
            bottom: TabBar(
              tabs: [
                Tab(text: '承包信息'),
                Tab(text: '家庭成员'),
                Tab(text: '地块信息'),
                Tab(text: '权证信息'),
              ],
            ),
            title: Text('国家级农村土地承包经营权公众查询系统'),
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
              getFamily(list),
              getLand(data['DK']),
              getTableList({
                '权证流水号': data['CBJYQZDJB']['CBJYQZLSH'],
                '发证日期': grantDate,
                '领取人姓名': data['CBJYQZ']['QZLQRXM'],
                '发证机关': data['CBJYQZ']['FZJG'],
                '领取人证件号': data['CBJYQZ']['QZLQRZJHM'],
                '权证是否领取': data['CBJYQZ']['QZSFLQ'] == '1' ? '是' : '否',
              }),
            ],
          ),
        ),
      ),
    );
  }
}
