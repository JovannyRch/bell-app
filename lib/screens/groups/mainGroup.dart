import 'package:bell_app/responses/auth_response.dart';
import 'package:bell_app/widgets/colleagues_widget.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
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
      ),
    );
  }

  Widget header() {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: _size.height * 0.15),
          Image.asset('images/team.png', height: 80.0),
          titleGroup(),
          SizedBox(height: 10.0),
          Text(
            "Shake your phone to notify",
            style: TextStyle(
              color: Colors.black45,
              letterSpacing: 1.1,
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
