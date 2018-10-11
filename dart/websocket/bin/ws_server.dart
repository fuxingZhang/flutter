import 'dart:io';
import 'dart:convert';

main() async {
  //HTTP服务器，绑定IP和端口
  var server = await HttpServer.bind(InternetAddress.LOOPBACK_IP_V4, 4040);

  //存储客户端名称和套接字
  Map<String, WebSocket> chatClients = new Map<String, WebSocket>();

/////////////////////////////////////////////
  /**
   * 通过遍历Map
   * 向所有在线客户端发送最新的列表
   *
   * 数据使用Json格式
   * {
   *   'code': 命令
   *   'data': 在线列表的数据为List，接收客户端名称和发送消息为Map
   * }
   */
  void sendList() {
    chatClients.values.forEach((socket) {
      socket.add(JSON.encode({
        'code': "list",
        'data': chatClients.keys.toList()
      }));
    });
  }

  /**
   * 遍历Map，发送消息
   * 此时的String data已经经过JSON编码
   */
  void sendSpeak(String data) {
    chatClients.values.forEach((socket) {
      socket.add(data);
    });
  }
/////////////////////////////////////////////

/////////////////////////////////////////////
  /**
   * 处理服务器接收到的请求
   *
   * 主要流程：
   *   1、将HttpRequest请求提升为WebSocket链接
   *   2、监听客户端发送到服务器的数据（连接和发送消息）
   *   3、客户端关闭连接的时候，删除Map中存储的客户端数据，并更新最新列表
   */
  await for (HttpRequest req in server) {
    if (req.uri.path == '/ws') {
      // 将一个HttpRequest提升为WebSocket连接
      var socket = await WebSocketTransformer.upgrade(req);

      //昵称、IP、端口，用于服务器输出
      String name = '';
      String address = req.connectionInfo.remoteAddress.address;
      int port = req.connectionInfo.remotePort;

      //监听客户端发送过来的数据
      socket.listen((event) {
        var message = JSON.decode(event);

        //connect和speak数据都使用了Map
        if(message is! Map) {
          return;
        }

        switch(message['code']) {
          case 'connect':
            name = message['data']['name'];
            //保存套接字，更新在线列表
            chatClients[name] = socket;
            print("客户端连接 昵称：$name IP：$address 端口：$port");
            sendList();
            break;
          case 'speak':
            //发送消息
            print(message['data']);
            sendSpeak(event);
            break;
          default:
            print("接收到Message Data：${event.data}");
        }
      });

      //客户端关闭的时候，删除存储信息，更新在线列表
      socket.done.whenComplete(() {
        chatClients.remove(name);
        print("客户端连接断开连接 昵称：$name IP：$address 端口：$port");
        sendList();
      });
    }
  }
/////////////////////////////////////////////
}