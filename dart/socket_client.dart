import 'dart:io';
import 'dart:convert';

main() async {
  //连接服务器的4041端口
  var socket = await Socket.connect(InternetAddress.LOOPBACK_IP_V4, 4041);

  print("向Server发送数据:Server 你好！");
  socket.add(UTF8.encode('Server 你好！'));
  socket.transform(UTF8.decoder).listen((data) {
    print("接收到来自Server的数据：" + data);
  });
}