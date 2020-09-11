import 'package:bell_app/const/conts.dart';
import 'package:bell_app/services/auth_service.dart';
import 'package:bell_app/widgets/title_screen_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  AuthService auth;
  Size _size;
  @override
  Widget build(BuildContext context) {
    auth = Provider.of<AuthService>(context);
    _size = MediaQuery.of(context).size;

    _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _profileContainer(context),
              _banner(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _banner() {
    return auth.user.isPremium
        ? Container()
        : Container(
            margin: EdgeInsets.only(top: 40.0),
            width: _size.width * 0.8,
            color: Colors.grey.withOpacity(0.03),
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Get unlimited access on:",
                  style: TextStyle(
                    color: Colors.black45,
                    fontSize: 18.0,
                  ),
                ),
                _item(
                  FaIcon(
                    FontAwesomeIcons.star,
                    color: kBaseColor,
                  ),
                  "Add multiple users in your groups",
                ),
                _item(
                  FaIcon(
                    FontAwesomeIcons.star,
                    color: kBaseColor,
                  ),
                  "Create ulimited groups",
                ),
                SizedBox(height: 30.0),
                Center(
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: kBaseColor),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Get premium for \$3.99/mo",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: kBaseColor,
                      ),
                    ),
                    //color: kBaseColor,
                  ),
                )
              ],
            ),
          );
  }

  Widget _item(FaIcon icon, String text) {
    return Container(
      margin: EdgeInsets.only(top: 15.0),
      child: Row(
        children: [
          icon,
          SizedBox(width: 20.0),
          Text(
            text,
            style: TextStyle(
              fontSize: 18.0,
              letterSpacing: 0.5,
            ),
          )
        ],
      ),
    );
  }

  Widget logoutButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //TODO: Delete data
        Navigator.pushReplacementNamed(context, '/login');
      },
      child: Container(
        height: 50.0,
        decoration: BoxDecoration(
          color: kBaseColor,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Container(
          width: _size.width * 0.3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Logout",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              FaIcon(
                FontAwesomeIcons.signOutAlt,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _profileContainer(BuildContext context) {
    return Container(
      height: _size.height * 0.45,
      width: _size.width * 0.8,
      padding: EdgeInsets.all(10.0),
      //color: Colors.grey.withOpacity(0.05),
      child: Column(
        children: [
          Image.asset(
            'images/person.png',
            height: _size.height * 0.2,
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            auth.user.name,
            style: TextStyle(
              color: Colors.black54,
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 30.0,
            ),
            height: 1.0,
            width: _size.width * 0.6,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: kBaseColor.withOpacity(0.5),
            ),
          ),
          Expanded(child: Container()),
          Container(
            margin: EdgeInsets.only(top: 10.0),
            child: logoutButton(context),
          ),
        ],
      ),
    );
  }
}
