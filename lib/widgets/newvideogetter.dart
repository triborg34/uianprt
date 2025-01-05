import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:uianprt/model/consts.dart';
import 'package:uianprt/widgets/videogetter.dart';

class VideoStream extends StatefulWidget {
  const VideoStream({Key? key}) : super(key: key);

  @override
  State<VideoStream> createState() => _VideoStreamState();
}

class _VideoStreamState extends State<VideoStream> {
  final WebSocket _socket = WebSocket("ws://127.0.0.1:5000/rt1");
  bool _isConnected = false;
  void connect(BuildContext context) async {
    _socket.connect();
    setState(() {
      _isConnected = true;
    });
  }

  void disconnect() {
    _socket.disconnect();
    setState(() {
      _isConnected = false;
    });
  }

  @override
  void initState() {
    connect(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_isConnected) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: purpule)),
        padding: EdgeInsets.all(8.0),
        height: 350,
        width: MediaQuery.sizeOf(context).width * 0.5,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: StreamBuilder(
            stream: _socket.stream,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(child: const CircularProgressIndicator());
              }

              if (snapshot.connectionState == ConnectionState.done) {
                return  Center(
                    child: ElevatedButton(
                        onPressed: () {
                          WebSocket webSocket =
                              WebSocket("ws://127.0.0.1:5000");
                          webSocket.connect();
                        },
                        child: Icon(Icons.repeat)));
              }
              //? Working for single frames
              return Image.memory(
                Uint8List.fromList(
                  base64Decode(
                    (snapshot.data.toString()),
                  ),
                ),
                gaplessPlayback: true,
                fit: BoxFit.fill,
                excludeFromSemantics: true,
              );
            },
          ),
        ),
      );
    } else {
      return ElevatedButton(
          onPressed: () {
            WebSocket webSocket = WebSocket("ws://127.0.0.1:5000");
            webSocket.connect();
          },
          child: Icon(Icons.repartition));
    }
  }
}
