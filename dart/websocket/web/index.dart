import 'dart:html';
import 'dart:convert';

/**
* 客户端类
*
* 主要流程：
*   1、查找HTML中各个DOM控件对象
*   2、监听昵称输入框（回车，并且值改变）
*     2.1 清空在线列表、消息输入框、消息显示框
*     2.2 连接WebSocket服务器，监听onOpen、onMessage、onClose事件
*     2.3 服务器发送来的Message有两个命令：list、speak，分别进行处理
*   3、监听消息输入框，向WebSocket服务器发送数据
*/
class Client {
  WebSocket ws;
/////////////////////////////////////////////
  //登陆界面
  DivElement enterScreen = querySelector("#enter_screen");
  //昵称输入框
  InputElement nameElement = querySelector("#name");

  //聊天界面
  DivElement chatScreen = querySelector("#chat_screen");
  //消息输入框
  InputElement inputElement = querySelector("#speak");
  //消息显示框
  DivElement context = querySelector("#context");
  //在线列表
  DivElement chatListElement = querySelector("#nameslist");
/////////////////////////////////////////////

  String chatName;

  Client() {
    //监听昵称输入框
    initNameListen();
    //监听消息输入框
    initInputListen();
  }

  void initNameListen() {
    nameElement.onChange.listen((e) {
      //取消Dom事件的默认动作
      e.preventDefault();

      //清空DOM控件
      addNames([]);
      context.children.clear();
      inputElement.value = "";

      //连接服务器
      ws = new WebSocket("ws://127.0.0.1:4040/ws");

      ws.onOpen.listen((e) {
        print("已连接服务器 ${ws.url}");
        //保存昵称
        chatName = nameElement.value;
        //显示聊天界面
        initHTML(true);

        //向服务器发送客户端信息
        var newUser = {'code': 'connect', 'data': {'name': chatName}};
        //消息输入框设置为可用
        inputElement.disabled = false;
        ws.send(JSON.encode(newUser));
      });

      //监听接收到的Message数据
      ws.onMessage.listen(onMessage);

      //关闭事件，显示登陆界面，隐藏聊天界面，清空昵称输入框
      ws.onClose.listen((e) {
        print("服务器连接已断开");
        initHTML(false);
        nameElement.value = '';
      });

      //终止事件的派发
      e.stopPropagation();
    });
  }

  void onMessage(MessageEvent event) {
    Map message = JSON.decode(event.data);

    switch(message['code']) {
      case 'speak':
        addText(message['data']['name'], message['data']['text']);
        break;
      case 'list':
        addNames(message['data']);
        break;
      default:
        print("接收到Message Data：${event.data}");
    }
  }

  void initInputListen() {
    //当输入框数据改变并回车的时候，触发onChange事件
    inputElement.onChange.listen((e) {
      //待发送的消息
      String value = inputElement.value;
      inputElement.value = '';

      print(value);
      var request = {
        'code': 'speak',
        'data': {
          'name': chatName,
          'text': value
        }
      };
      //发送数据
      ws.send(JSON.encode(request));
    });
  }

/////////////////////////////////////////////
  //刷新消息显示框
  void addText(String name, String text) {
    var result = new DivElement();
    result.innerHtml = "$name : $text";
    context.children.add(result);
  }

  //刷新在线列表
  void addNames(List names) {
    print("刷新在线用户列表：$names");

    chatListElement.children.clear();
    for(var name in names) {
      addName(name);
    }
  }

  void addName(String name) {
    var result = new DivElement();
    result.innerHtml = "$name";
    chatListElement.children.add(result);
  }
/////////////////////////////////////////////

  /**
   * isConnected
   *   true：隐藏登陆界面，显示聊天界面
   *   false：显示登陆界面，显示聊天界面
   */
  void initHTML(bool isConnected) {
    if(isConnected) {
      enterScreen.style.display = "none";
      chatScreen.style.display = "block";
      inputElement.focus();
    } else {
      enterScreen.style.display = "block";
      chatScreen.style.display = "none";
      nameElement.focus();
    }
  }
}

void main() {
  var client = new Client();
}