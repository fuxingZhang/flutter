import 'dart:io';

main() async {
  var socket = await WebSocket.connect('ws://127.0.0.1:4040/ws');
  socket.add('Hello, World!');
  socket.listen((event) {
    print("Server: $event");
  });
  socket.close();
}