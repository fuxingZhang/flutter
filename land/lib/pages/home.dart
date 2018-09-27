import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import '../components/DropdownButton.dart';
import '../components/TextField.dart';
import './user.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String captchaId;
  String captchaInput;
  String token;
  UriData captcha = Uri.parse('data:image/png;base64,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').data;

  Map<String, String> form = {
    'name': '',
    'cardType': '1',
    'card': '',
    'qzhm': '',
  };
  
  void _login() async {
    if(form['name'] == '') {
      _showDialog('姓名不能为空');
      return;
    }
    if(form['card'] == '') {
      _showDialog('证件号码不能为空');
      return;
    }
    if(form['qzhm'] == '') {
      _showDialog('权证号码不能为空');
      return;
    }
    if(captchaInput == null) {
      _showDialog('验证码不能为空');
      return;
    }
    http.Response response = await http.post(
      'https://www.gisstack.xyz/v1/api/captcha',
      body:{
        'id': captchaId,
        'code': captchaInput
      }
    );
    _getCapcha();
    final jsonData = json.decode(response.body);
    print(jsonData);
    if(jsonData['pass'] == false) {
      _showDialog('验证码错误');
      setState(() {
        captchaInput = '';
      });
      return;
    }
    token = jsonData['token'];
    _getUserInfo();
  }

  void _getUserInfo() async {
    final str = '${form['name']}&${form['cardType']}&${form['card']}&${form['qzhm']}';
    final body = utf8.fuse(base64).encode(str);
    http.Response response = await http.get(
      'https://www.gisstack.xyz/v1/api/land',
      headers: {
        'token': token,
        'body': '6ZmI6L+c5paMJjEmNTEyOTI0MTk2NDA1MDM2NjM0JjUxMTMyMjIxNjIwNjA1MDA1NEo=',
      }
    );
    print(response.body);
    final jsonData = json.decode(response.body);
    print(jsonData);
    Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context){
      return new User(data: jsonData);
    }));
  }

  Future<Null> _showDialog(text) async {
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
              child: new Text('确定'),
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
        title: Text('Do you really want to exit the app?'),
        actions: <Widget>[
          FlatButton(
            child: Text('No'),
            onPressed: () => Navigator.pop(context, false),
          ),
          FlatButton(
            child: Text('Yes'),
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

  _getCapcha() async {
    http.Response response = await http.get(
      'https://www.gisstack.xyz/v1/api/captcha',
    );
    final jsonData = json.decode(response.body);
    // print(jsonData);
    final UriData data = Uri.parse(jsonData['captcha']).data;
    // print(data.isBase64); 
    // print(data.contentAsBytes());
    if (mounted) {
      setState(() {
        captchaId = jsonData['id'];
        captcha = data;
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
          child: new SingleChildScrollView(
          // SingleChildScrollView 解决输入框超出屏幕会报错
          // resizeToAvoidBottomPadding: false也可以解决，但是输入框不会跟着键盘
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                new Container(
                  height: MediaQuery.of(context).padding.top
                ),
                new Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: new Image.asset('lib/assets/images/top_bg.png'),
                ),
                getTextField('请填写姓名', form, 'name'),
                new Padding(
                  padding: new EdgeInsets.only(bottom: 10.0, left: 30.0, right: 30.0),
                  child: DropdownButton(
                    items: getListData(),
                    hint: new Text('选择证件类型'),//当没有默认值的时候可以设置的提示
                    value: form['cardType'],//下拉菜单选择完之后显示给用户的值
                    onChanged: (T){//下拉菜单item点击之后的回调
                      setState(() {
                        form['cardType'] = T;
                      });
                    },
                    elevation: 24,//设置阴影的高度
                    style: new TextStyle(//设置文本框里面文字的样式
                      inherit: false, 
                      // fontWeight: FontWeight.bold, 
                      color: Colors.black,
                      decorationColor: Colors.black,
                    ),
                    isDense: false,//减少按钮的高度。默认情况下，此按钮的高度与其菜单项的高度相同。如果isDense为true，则按钮的高度减少约一半。 这个当按钮嵌入添加的容器中时，非常有用
                    iconSize: 50.0,
                  )
                ),
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
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: '请填写验证码',
                            hintStyle: new TextStyle(
                              fontWeight: FontWeight.bold, 
                              color: Colors.white,
                            )
                          ),
                          onChanged: (T){
                            captchaInput = T;
                          },
                        ),
                      ),
                      new Expanded(
                        flex: 1,
                        child: new FittedBox(
                          fit: BoxFit.scaleDown, // otherwise the logo will be tiny
                          child: new GestureDetector(
                            onTap: () {
                              _getCapcha();
                            },
                            child: Image.memory(
                              captcha.contentAsBytes(), 
                              color: Colors.white, 
                              scale: 0.7,
                              repeat:ImageRepeat.noRepeat,
                              width: 100.0,
                              height: 50.0,
                            ),
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
                    padding: new EdgeInsets.only(top: 20.0, bottom: 20.0),
                    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                    onPressed: _login,
                    child: new Text(
                      '权证查询',
                      style: new TextStyle(
                        // fontWeight: FontWeight.bold, 
                        fontSize: 24.0,
                        color: Color(0xFF664c03)
                      )
                    ),
                  ),
                ),
              ],
            ),
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
