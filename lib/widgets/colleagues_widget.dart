import 'package:bell_app/const/conts.dart';
import 'package:bell_app/responses/auth_response.dart';
import 'package:flutter/material.dart';

class ColleaguesGroup extends StatelessWidget {
  List<User> users = [];
  ColleaguesGroup(this.users);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: users.map((e) => _userWidget(e)).toList(),
    );
  }

  Widget _userWidget(User u) {
    return Container(
      height: 85.0,
      margin: EdgeInsets.symmetric(vertical: 10.0),
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
      decoration: BoxDecoration(
        color: kBaseColor.withOpacity(0.07),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        children: [
          Image.asset(
            'images/person.png',
            height: 50.0,
          ),
          SizedBox(width: 10.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  u.name,
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 23.0,
                  ),
                ),
                Text(
                  "Software Enginner",
                  style: TextStyle(
                    color: Colors.black45,
                    fontSize: 17.0,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
