import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import '../components/DropdownButton.dart';
import '../components/TextField.dart';
import './user.dart';
import '../config/config.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String captchaId;
  String token;
  Widget captcha = Container(
    height: 48.0,
    padding: EdgeInsets.all(14.0),
    margin: EdgeInsets.all(0.0),
    child: new FittedBox(
      fit: BoxFit.scaleDown, 
      alignment: Alignment.center,
      child: const CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(Colors.white),
        backgroundColor: Colors.black,
      ),
    )
  );

  Map<String, String> form = {
    'name': null,
    'cardType':  null,  // 使用 'cardType': '' 会报错
    // 'cardType':  '1',
    'card': null,
    'qzhm': null,
    'captchaInput': null
  };
  
  void _login() async {
    bool pass = true;
    String alertText = '';
    Map<String, String> map = {
      'name': '姓名',
      'cardType': '证件类型', 
      'card': '证件号码',
      'qzhm': '权证号码',
      'captchaInput': '验证码',
    };
    map.forEach((key, value){
      print(key);
      if(form[key] == null)  {
        pass = false;
        alertText += alertText == '' ? value : ',$value';
      }
    });
    if(!pass) {
      _showDialog('输入信息缺少以下内容: \n$alertText');
      return;
    }
    http.Response response = await http.post(
      '${Config['baseUrl']}/v1/api/captcha',
      body:{
        'id': captchaId,
        'code': form['captchaInput']
      }
    );
    if(response.statusCode != 200) {
      _getCapcha();
      _showDialog(response.body);
      return;
    }
    final jsonData = json.decode(response.body);
    print(jsonData);
    if(jsonData['pass'] == false) {
      _getCapcha();
      _showDialog('验证码错误');
      return;
    }
    token = jsonData['token'];
    _getUserInfo();
  }

  void _getUserInfo() async {
    final str = '${form['name']}&${form['cardType']}&${form['card']}&${form['qzhm']}';
    final body = utf8.fuse(base64).encode(str);
    http.Response response = await http.get(
      '${Config['baseUrl']}/v1/api/land',
      headers: {
        'token': token,
        'body': '6ZmI6L+c5paMJjEmNTEyOTI0MTk2NDA1MDM2NjM0JjUxMTMyMjIxNjIwNjA1MDA1NEo=',
      }
    ); 
    // ).catchError(onError);  
    print(response.body);
    print(response.statusCode);
    if(response.statusCode != 200) {
      _showDialog(response.body);
      return;
    }
    final jsonData = json.decode(response.body);
    print(jsonData);
    Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context){
      return new User(data: jsonData);
    }));
  }

  // void onError(Error error) {
  //   _showDialog(error.toString());
  // }

  Future<Null> _showDialog(String text) async {
    return showDialog<Null>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return new AlertDialog(
          title: new Text(text),
          // content: new SingleChildScrollView(
          //   child: new ListBody(
          //     children: <Widget>[
          //       new Text('请输入图形验证码内的数字'),
          //     ],
          //   ),
          // ),
          actions: <Widget>[
            new FlatButton(
              child: new Text(
                '确定', 
                style: new TextStyle(
                  fontSize: 18.0
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<bool> _onWillPop() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('你确定要退出应用吗？'),
        actions: <Widget>[
          FlatButton(
            child: Text('否'),
            onPressed: () => Navigator.pop(context, false),
          ),
          FlatButton(
            child: Text('是'),
            onPressed: () => Navigator.pop(context, true),
          ),
        ],
      )
    );
  }

  @override
  initState(){
    super.initState();
    _getCapcha();
  }

  void _getCapcha() async {
    http.Response response = await http.get(
      '${Config['baseUrl']}/v1/api/captcha',
    );
    if(response.statusCode != 200) {
      _showDialog(response.body);
      return;
    }
    final jsonData = json.decode(response.body);
    // print(jsonData);
    final UriData data = Uri.parse(jsonData['captcha']).data;
    // print(data.isBase64); 
    // print(data.contentAsBytes());
    if (mounted) {
      setState(() {
        captchaId = jsonData['id'];
        form['captchaInput'] = null;

        captcha = Image.memory(
          data.contentAsBytes(), 
          color: Colors.white, 
          scale: 0.7,
          repeat:ImageRepeat.noRepeat,
          // width: 100.0,
          height: 44.0,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: _onWillPop,
      child: new Scaffold(
        // appBar: new AppBar(
        //   // Here we take the value from the MyHomePage object that was created by
        //   // the App.build method, and use it to set our appbar title.
        //   title: new Text(widget.title),
        // ),
        body: new Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(0.0),
          color: Color(0xFF468081),
          // SingleChildScrollView 解决输入框超出屏幕会报错
          // resizeToAvoidBottomPadding: false也可以解决，但是输入框不会跟着键盘
          child: new SingleChildScrollView(
            // SafeArea 防止对操作系统的侵入，避免自己写 
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  // 这里是为了使图片不侵入状态栏，更好的方案是使用 SafeArea
                  // 当然如果巧妙设计图片颜色，比如12306网站，侵入状态栏可以做到更漂亮
                  // new Container(
                  //   height: MediaQuery.of(context).padding.top
                  // ),
                  // 如果SizedBox前面带const，则height后面必须是10.0这样的固定值，而不能是MediaQuery.of(context).padding.top这样的变量
                  // SizedBox(height: MediaQuery.of(context).padding.top), 
                  // const SizedBox(height: 8.0), 
                  new Padding(
                    padding: EdgeInsets.zero,
                    // padding: EdgeInsets.all(0.0),
                    // padding: new EdgeInsets.all(0.0),
                    // padding: const EdgeInsets.all(0.0),
                    child: new Image.asset('lib/assets/images/top_bg.png'),
                  ),
                  getTextField('请填写姓名', form, 'name'),
                  // 1、去除下划线；
                  // 2、放在这里或者下面的padding、InputDecoration内部都行，flutter的灵活性很强
                  getDropDownButton(form, setState),
                  getTextField('请填写证件号码', form, 'card'),
                  getTextField('请填写承包经营权证代码', form, 'qzhm'),
                  new Padding(
                    padding: new EdgeInsets.only(bottom: 10.0, left: 30.0, right: 30.0),
                    child: new Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Expanded(
                          flex: 2,
                          child: TextField(
                            style: new TextStyle(
                              height: 1.0,
                              fontWeight: FontWeight.bold, 
                              color: Colors.black
                            ),
                            cursorColor: Color(0xFF2FD6D9),
                            controller: TextEditingController(text: form['captchaInput']),
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFF2FD6D9))),
                              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFF8FC8C9))),
                              contentPadding: EdgeInsets.all(12.0),
                              hintText: '请填写验证码',
                              hintStyle: new TextStyle(
                                fontWeight: FontWeight.bold, 
                                color: Colors.white,
                              )
                            ),
                            onChanged: (T){
                              form['captchaInput'] = T;
                            },
                            // maxLength: 4,
                            maxLengthEnforced: false,
                            // keyboardType: TextInputType.numberWithOptions(signed: false, decimal: false),
                            keyboardType: TextInputType.number, //text, multiline, number, phone, datetime, emailAddress, url,
                            // autofocus: true,
                            // focusNode: FocusNode(),
                            // obscureText: true, // 用于密码
                            // scrollPadding: const EdgeInsets.all(20.0),
                            // textCapitalization: TextCapitalization.sentences // 句子开头大写
                            // textCapitalization: TextCapitalization.words // 每一个单词开头大写
                            textInputAction: TextInputAction.done,     // next, newline,done,send,search
                            // keyboardAppearance: Brightness.dark, //键盘的外观。此设置仅适用于iOS设备。
                          ),
                        ),
                        new Expanded(
                          flex: 1,
                          child:new GestureDetector(
                            onTap: () {
                              _getCapcha();
                            },
                            child: new Padding(
                              padding: EdgeInsets.only(left: 6.0),
                              child: captcha,
                            ),
                          ),
                        ),
                      ],
                    )
                  ),
                  new Container(
                    margin: const EdgeInsets.only(bottom: 30.0),
                    padding: new EdgeInsets.only(left: 30.0, right: 30.0),
                    child:  RaisedButton(
                      color: Color(0xFFdab251),
                      padding: new EdgeInsets.only(top: 12.0, bottom: 12.0),
                      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(80.0)),
                      onPressed: _login,
                      child: new Text(
                        '权证查询',
                        style: new TextStyle(
                          // fontWeight: FontWeight.bold, 
                          fontSize: 20.0,
                          color: Color(0xFF664c03)
                        )
                      ),
                    ),
                  ),
                  new Padding(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed('/userGuide');
                      },
                      child: Text('用户指南',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18.0,
                          height: 1.0,
                          color: Colors.white
                        )
                      )
                    )
                  ),
                  Text('农业农村部农村经济体制与经营管理司',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFA3C3C3),
                      fontSize: 14.0
                    )
                  ),
                  new Padding(
                    padding: EdgeInsets.only(bottom: 20.0),
                    child: Text('农业农村部规划设计研究院   版权所有',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFA3C3C3),
                        fontSize: 14.0
                      )
                    ),
                  )
                ],
              ),
            )
          ),
        ),
      ), 
      // floatingActionButton: new FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: new Icon(Icons.add),
      // ),
      // This trailing comma makes auto-formatting nicer for build methods.
      // resizeToAvoidBottomPadding: false
    );
  }
}
