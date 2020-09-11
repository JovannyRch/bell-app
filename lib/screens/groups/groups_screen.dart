import 'package:bell_app/models/Group.dart';
import 'package:flutter/material.dart';
import 'package:bell_app/widgets/title_screen_widget.dart';

class GroupsScreen extends StatefulWidget {
  GroupsScreen({Key key}) : super(key: key);

  @override
  _GroupsScreenState createState() => _GroupsScreenState();
}

class _GroupsScreenState extends State<GroupsScreen> {
  Size _size;
  List<Group> groups = [
    Group(id: 1, name: "Human Resources", total: 32),
    Group(id: 2, name: "Gamers", total: 14),
    Group(id: 3, name: "Project Managers", total: 17),
    Group(id: 4, name: "Project Auroxium", total: 6),
    Group(id: 3, name: "Project Managers", total: 17),
    Group(id: 4, name: "Project Auroxium", total: 6),
    Group(id: 3, name: "Project Managers", total: 17),
    Group(id: 4, name: "Project Auroxium", total: 6),
  ];
  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: _size.height,
        child: SafeArea(
            child: Column(
          children: [
            TitleScreen("My Groups"),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: _paintGroups(),
                ),
              ),
            )
          ],
        )),
      ),
      backgroundColor: Colors.grey.withOpacity(0.05),
    );
  }

  List<Widget> _paintGroups() {
    List<Widget> result = [];
    for (int i = 0; i < (groups.length / 2).ceil(); i++) {
      result.add(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          groupWidget(groups[i * 2]),
          groupWidget(
            groups[i * 2 + 1],
          )
        ],
      ));
    }
    if (!groups.length.isEven) {
      result.add(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [groupWidget(groups.last)],
      ));
    }
    return result;
  }

  Widget groupWidget(Group g) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _titleGroup(g.name),
          _labelTotal(
            g.total,
          )
        ],
      ),
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      height: 130.0,
      width: _size.width * 0.35,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
    );
  }

  Widget _labelTotal(int total) {
    return Text(
      "$total participants",
      style: TextStyle(
        color: Colors.black45,
        fontSize: 13.0,
      ),
    );
  }

  Widget _titleGroup(String title) {
    return Container(
      child: Text(
        title,
        textAlign: TextAlign.start,
        style: TextStyle(
          fontSize: 20.0,
          color: Colors.black54,
        ),
      ),
    );
  }
}
