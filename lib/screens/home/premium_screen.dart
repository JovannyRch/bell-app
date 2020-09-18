import 'package:bell_app/const/conts.dart';
import 'package:flutter/material.dart';

import 'package:flutter_credit_card/flutter_credit_card.dart';

class PremiumScreen extends StatefulWidget {
  @override
  _PremiumScreenState createState() => _PremiumScreenState();
}

class _PremiumScreenState extends State<PremiumScreen> {
  String cardNumber = "";

  String expiryDate = "";

  String cvvCode = "";

  String cardHolderName = "";

  bool isCvvFocused = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
          child: Column(
            children: [
              CreditCardWidget(
                cardNumber: cardNumber,
                expiryDate: expiryDate,
                cardHolderName: cardHolderName,
                cvvCode: cvvCode,
                showBackView: isCvvFocused,
                height: 175,
                textStyle: TextStyle(color: Colors.white),
                width: MediaQuery.of(context).size.width,
                animationDuration: Duration(milliseconds: 1000),
              ),
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (val) {
                  setState(() {
                    isCvvFocused = false;
                    cardNumber = val;
                  });
                },
                decoration: InputDecoration(
                  labelText: "Card Number",
                ),
              ),
              TextField(
                keyboardType: TextInputType.datetime,
                onChanged: (val) {
                  setState(() {
                    isCvvFocused = false;
                    expiryDate = val;
                  });
                },
                decoration: InputDecoration(
                  labelText: "Expired Date",
                ),
              ),
              TextField(
                onChanged: (val) {
                  setState(() {
                    isCvvFocused = false;
                    cardHolderName = val;
                  });
                },
                decoration: InputDecoration(
                  labelText: "Call Holder",
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (val) {
                  setState(() {
                    isCvvFocused = true;
                    cvvCode = val;
                  });
                },
                decoration: InputDecoration(
                  labelText: "CVV",
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 10.0,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: kBaseColor,
                  ),
                  child: Text(
                    "Purchase",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
