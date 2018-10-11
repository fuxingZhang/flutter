import 'dart:io';
import 'dart:convert';

main() async {
  /**
   * reuseAddress参数默认为true
   * 允许多个进程同时监听、绑定同一个端口
   */
  var rawDgramSocket = RawDatagramSocket.bind(InternetAddress.LOOPBACK_IP_V4, 4041);

  rawDgramSocket.then((socket) {
    //监听套接字事件
    socket.listen((event) {
      if(event == RawSocketEvent.READ) {
        print(UTF8.decode(socket.receive().data));
        socket.send(UTF8.encode("已收到！"), InternetAddress.LOOPBACK_IP_V4, 4042);
      }
    });
  });
}