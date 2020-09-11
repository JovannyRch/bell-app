import 'dart:async';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:bell_app/responses/auth_response.dart';
import 'package:bell_app/services/socket_service.dart';
import 'package:bell_app/widgets/blur_notification_widget.dart';
import 'package:bell_app/widgets/colleagues_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shake/shake.dart';

class MainGroup extends StatefulWidget {
  MainGroup({Key key}) : super(key: key);

  @override
  _MainGroupState createState() => _MainGroupState();
}

class _MainGroupState extends State<MainGroup> {
  Size _size;

  List<User> users = [
    User(id: 1, name: "user 1"),
    User(id: 2, name: "user 2"),
    User(id: 3, name: "user 3"),
    User(id: 4, name: "user 4"),
    User(id: 5, name: "user 5"),
    User(id: 6, name: "user 6"),
    User(id: 7, name: "user 7"),
    User(id: 8, name: "user 8"),
  ];

  Timer timer;
  String name = "";

  final assetAudioPlayer = new AssetsAudioPlayer();

  SocketService socketService;
  @override
  void initState() {
    ShakeDetector detector = ShakeDetector.autoStart(onPhoneShake: () {
      if (!socketService.isSendingNotification) {
        socketService.emit('notification', {'evento': 'Nuevo negocio'});
      }
    });
    socketService = Provider.of<SocketService>(context, listen: false);
    super.initState();
  }

  void playSong() {
    AssetsAudioPlayer.newPlayer().open(
      Audio("audios/bell.mp3"),
      showNotification: true,
    );
  }

  void sendNotification() {
    socketService.isSendingNotification = true;
    playSong();

    timer = Timer(Duration(seconds: 5), () {
      socketService.isSendingNotification = false;

      timer.cancel();
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
    _size = MediaQuery.of(context).size;
    return Scaffold(
      body: BlurNotification(
        isShowing: (socketService.isNewNotification ||
            socketService.isSendingNotification),
        children: [
          _content(),
        ],
      ),
    );
  }

  Widget _content() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            header(),
            _titleColleagues(),
            _members(),
          ],
        ),
      ),
    );
  }

  Widget blurContainer() {
    return Container();
  }

  Widget header() {
    String srcImage = 'images/team.png';

    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: _size.height * 0.15),
          Image.asset(srcImage, height: 80.0),
          titleGroup(),
          SizedBox(height: 10.0),
          GestureDetector(
            onTap: () {
              sendNotification();
            },
            child: Text(
              "Shake your phone to notify",
              style: TextStyle(
                color: Colors.black45,
                letterSpacing: 1.1,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _members() {
    return Expanded(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ColleaguesGroup(users),
          ],
        ),
      ),
    );
  }

  Widget _titleColleagues() {
    return Container(
      margin: EdgeInsets.only(
        top: 40.0,
        bottom: 10.0,
      ),
      child: Text(
        "My colleagues",
        style: TextStyle(
          fontSize: 20.0,
          color: Colors.black54,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }

  Widget titleGroup() {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      child: Text(
        "Group Name",
        style: TextStyle(
          color: Colors.black87,
          fontSize: 27.0,
        ),
      ),
    );
  }
}
