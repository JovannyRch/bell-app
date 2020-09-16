import 'package:bell_app/const/conts.dart';
import 'package:bell_app/helpers/showAlert.dart';
import 'package:bell_app/screens/auth/widgets/bg_widget.dart';
import 'package:bell_app/screens/auth/widgets/blurContainer.dart';
import 'package:bell_app/screens/auth/widgets/button_auth.dart';
import 'package:bell_app/screens/auth/widgets/custom_input.dart';
import 'package:bell_app/screens/auth/widgets/input_widget.dart';
import 'package:bell_app/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  Size _size;
  bool isLoading = false;

  TextEditingController password = new TextEditingController();
  TextEditingController password2 = new TextEditingController();
  TextEditingController username = new TextEditingController();
  TextEditingController name = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Scaffold(
        body: BlurContainer(
      isLoading: isLoading,
      color: kBaseColor,
      children: [
        HeaderWave(),
        Positioned(
          top: 25.0,
          left: 10.0,
          child: IconButton(
            icon: Icon(
              Icons.chevron_left,
              size: 40.0,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        content(),
      ],
    ));
  }

  Widget content() {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          logo(),
          form(),
        ],
      ),
    );
  }

  Widget socialMedia() {
    return Container(
      child: Column(
        children: [
          Text(
            "Or create using social media",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0),
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              btnImage('images/facebook.png'),
              btnImage('images/google-mas.png'),
              btnImage('images/linkedin.png'),
            ],
          )
        ],
      ),
    );
  }

  Widget btnImage(String path) {
    return Image.asset(path, height: 30.0);
  }

  Widget logo() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Bell App",
            style: TextStyle(
              color: Colors.white,
              fontSize: 60.0,
            ),
          ),
        ],
      ),
    );
  }

  void changeLoading(bool val) {
    setState(() {
      isLoading = val;
    });
  }

  void onRegister() async {
    //TODO: Validate
    if (name.text.isEmpty) {
      showAlert(context, 'Error', 'The name field is required');
      return;
    }

    if (username.text.isEmpty) {
      showAlert(context, 'Error', 'The email field is required');
      return;
    }

    if (password.text.isEmpty) {
      showAlert(context, 'Error', 'The password field is required');
      return;
    }
    if (password.text != password2.text) {
      showAlert(context, 'Error', "Passwords doesn't match");
      return;
    }

    Focus.of(context).unfocus();
    final auth = Provider.of<AuthService>(context, listen: false);
    changeLoading(true);
    bool ok = await auth.registration(username.text, name.text, password.text);
    changeLoading(false);
  }

  Widget form() {
    return Container(
      width: _size.width * 0.75,
      child: Column(
        children: [
          Text(
            "Create account",
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20.0),
          CustomInput(
            icon: Icons.person,
            placeholder: 'Full Name',
            textController: name,
          ),
          CustomInput(
              icon: Icons.person,
              placeholder: 'Email',
              textController: username),
          CustomInput(
            icon: Icons.lock_outline,
            placeholder: 'Password',
            textController: password,
            isPassword: true,
          ),
          CustomInput(
            icon: Icons.lock_outline,
            placeholder: 'Confirm your password',
            textController: password2,
            isPassword: true,
          ),
          SizedBox(
            height: 15.0,
          ),
          ButtonAuth("Register", isLoading ? null : onRegister),
          SizedBox(
            height: 40.0,
          ),
          socialMedia(),
        ],
      ),
    );
  }
}
