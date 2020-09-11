import 'package:bell_app/const/conts.dart';
import 'package:bell_app/screens/auth/login.dart';
import 'package:bell_app/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AuthService())],
      child: MaterialApp(
        theme: ThemeData(primaryColor: kBaseColor),
        debugShowCheckedModeBanner: false,
        title: 'Bell App',
        home: LoginScreen(),
      ),
    );
  }
}
