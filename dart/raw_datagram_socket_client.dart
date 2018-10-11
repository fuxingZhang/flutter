import 'dart:io';
import 'dart:convert';

main() async {
  var rawDgramSocket = RawDatagramSocket.bind(InternetAddress.LOOPBACK_IP_V4, 4042);

  rawDgramSocket.then((socket) {
    socket.send(UTF8.encode("你好！"), InternetAddress.LOOPBACK_IP_V4, 4041);

    socket.listen((event) {
      if(event == RawSocketEvent.READ) {
        print(UTF8.decode(socket.receive().data));
      }
    });
  });
}