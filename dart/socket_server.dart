import 'dart:io';
import 'dart:convert';

main() async {
  //绑定本地localhost的4041端口
  var serverSocket = await ServerSocket.bind(InternetAddress.LOOPBACK_IP_V4, 4041);

  //遍历所有连接到服务器的套接字
  await for(var socket in serverSocket) {
    //数据流Stream操作：监听接收到的数据
    socket.transform(UTF8.decoder).listen((data) {
      print("接收到来自Client的数据：" + data);
      print("向Client发送数据:Client 你好！");
      //缓冲池IOSink操作：写入数据
  socket.add(UTF8.encode('Client 你好！'));
    });
  }
}