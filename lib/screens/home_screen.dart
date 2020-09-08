import 'dart:async';

import 'package:bell_app/services/socket_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shake/shake.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Timer timer;
  String name = "";

  final assetAudioPlayer = new AssetsAudioPlayer();

  SocketService socketService;
  @override
  void initState() {
    ShakeDetector detector = ShakeDetector.autoStart(onPhoneShake: () {
      if (!socketService.isSendingNotification) {
        socketService.emit('notification', {'evento': 'Nuevo negocio'});
        sendingNotification();
        this.playSong();
      }
    });
    super.initState();
  }

  void playSong() {
    AssetsAudioPlayer.newPlayer().open(
      Audio("audios/bell.mp3"),
      showNotification: true,
    );
  }

  void sendingNotification() {
    print("Enviando notificación");
    socketService.isSendingNotification = true;
    timer = Timer(Duration(seconds: 5), () {
      setState(() {
        socketService.isSendingNotification = false;
        timer.cancel();
      });
    });
  }

  void onNewNotification() {
    playSong();
    timer = Timer(Duration(seconds: 5), () {
      setState(() {
        socketService.isNewNotification = false;
        timer.cancel();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    socketService = Provider.of<SocketService>(context);
    if (socketService.isNewNotification) {
      onNewNotification();
    }
    return Scaffold(
      body: Center(
        child: socketService.isNewNotification
            ? newNotifationWidget()
            : socketService.isSendingNotification
                ? sendingWidget()
                : normalStateWidget(),
      ),
    );
  }

  Widget normalStateWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          decoration: InputDecoration(
              labelText: "Type your name", labelStyle: TextStyle()),
          onChanged: (value) {
            setState(() {
              this.name = value;
            });
          },
        ),
        FlatButton(
          onPressed: () {
            socketService.emit('notification', {'name': this.name});
            sendingNotification();
            playSong();
          },
          child: Text("Shake your phone"),
        ),
      ],
    );
  }

  Widget newNotifationWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('images/bell2.gif'),
        Text("New notification from ${socketService.name}"),
      ],
    );
  }

  Widget sendingWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('images/bell2.gif'),
        Text("Sending notification"),
      ],
    );
  }
}
