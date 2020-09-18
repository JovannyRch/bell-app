import 'package:bell_app/const/conts.dart';
import 'package:bell_app/screens/auth/widgets/bg_widget.dart';
import 'package:bell_app/screens/home/code_screen.dart';
import 'package:bell_app/screens/home/premium_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NoPremiumScreen extends StatefulWidget {
  @override
  _NoPremiumScreenState createState() => _NoPremiumScreenState();
}

class _NoPremiumScreenState extends State<NoPremiumScreen> {
  Size _size;

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            HeaderWave(),
            Center(
              child: _banner(),
            )
          ],
        ),
      ),
    );
  }

  void onPremium() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => PremiumScreen(),
    );
  }

  void onCode() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => CodeScreen(),
    );
  }

  Widget _banner() {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(
                FontAwesomeIcons.crown,
                size: 30.0,
                color: Colors.yellow[800],
              ),
              SizedBox(
                width: 15.0,
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          GestureDetector(
            onTap: onPremium,
            child: Container(
              width: _size.width * 0.6,
              padding: EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 20.0,
              ),
              decoration: BoxDecoration(
                color: kBaseColor,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Text(
                "Go premium",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Text(
            "or",
            style: TextStyle(
              fontSize: 30.0,
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          FaIcon(
            FontAwesomeIcons.ticketAlt,
            color: Colors.yellow[800],
            size: 30.0,
          ),
          SizedBox(
            height: 20.0,
          ),
          GestureDetector(
            onTap: onCode,
            child: Container(
              width: _size.width * 0.6,
              padding: EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 20.0,
              ),
              decoration: BoxDecoration(
                color: kBaseColor,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Text(
                "I have a code",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
