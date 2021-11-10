import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

main(List<String> arguments) async {

  /**
   * Section 5 - Socket programming (HTTP)
   *
   * Start a server and listen to a server
   * Use http package to GET and POST
   *
   */

  //--------------------------------------------------------------------------

  /**
   * Assignment 5
   */

  var urlGet = 'http://httpbin.org/anything';
  print('Url to fetch ${urlGet}');
  var responseGet = await http.get(Uri.parse(urlGet));
  print('Length of webpage response ${responseGet.body.length}');

  //--------------------------------------------------------------------------

  /**
   * Section 5.21
   */

  /*var serverSocket = await ServerSocket.bind('127.0.0.1', 3000);
  print('Listening');

  await for (var socket in serverSocket) {
    socket.listen((List values) {
      print('${socket.remoteAddress}:${socket.remotePort} = ${utf8.decode(values)}');
    });
  }*/

  //--------------------------------------------------------------------------

  /**
   * Section 5.22
   */

  /*var socket = await Socket.connect('127.0.0.1', 3000);
  print('Connected');
  socket.write("Hello world"); // very quick
  print("Sent, closing");
  await socket.close(); // slower, hence async
  print("Closed");
  exit(0);*/

  //--------------------------------------------------------------------------

  /**
   * Section 5.23 - http GET
   */

  /*var urlGet = 'http://httpbin.org/asdasqwdd';
  var responseGet = await http.get(Uri.parse(urlGet));
  print('Response status ${responseGet.statusCode}');
  print('Response body ${responseGet.body}');*/

  //--------------------------------------------------------------------------

  /**
   * Section 5.23 - http POST
   */

  /*var urlPost = 'http://httpbin.org/post';
  var responsePost = await http.post(Uri.parse(urlPost), body: 'name=Bryan&color=Blue');
  print('Response status ${responsePost.statusCode}');
  print('Response body ${responsePost.body}');*/

  //--------------------------------------------------------------------------

  /**
   * Section 5.24 - UDP Sockets
   */

  /*var data = "Hello world";
  List<int> dataSend = utf8.encode(data);
  int port = 3000;

  //Server
  RawDatagramSocket.bind(InternetAddress.LOOPBACK_IP_V4, port).then((RawDatagramSocket udpSocket) {
    udpSocket.listen((RawSocketEvent event) {
      if (event == RawSocketEvent.READ) {
        Datagram dg = udpSocket.receive(); // when you ping a computer you send a Datagram
        print(utf8.decode(dg.data));
      }
    });

    // Client
    udpSocket.send(dataSend, InternetAddress.LOOPBACK_IP_V4, port);
    print('Sent');

  });*/


}