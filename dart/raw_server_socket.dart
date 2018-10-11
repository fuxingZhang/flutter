import 'dart:io';
import 'dart:convert';

/**
* 获取、发送IP协议数据包
* 浏览器访问http://localhost:4043
*/
main() async {
  var rawServerSocket = await RawServerSocket.bind(InternetAddress.LOOPBACK_IP_V4, 4043);

  rawServerSocket.listen((socket) {
    socket.listen((event) {
      if(event == RawSocketEvent.READ) {   //运行异常
        print(UTF8.decode(socket.read()));
        socket.write(UTF8.encode("""
        <!DOCTYPE html>
        <html>
          <head>
            <meta http-equiv="content-type" content="text/html;charset=utf-8">
          </head>
          
          <body>
            <h1>RawServerSocket 服务器</h1>
          </body>
        </html>
        """));
      }
    });
  });
}