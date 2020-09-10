import 'package:bell_app/screens/auth/login.dart';
import 'package:bell_app/screens/auth/register.dart';
import 'package:bell_app/screens/home_screen.dart';
import 'package:bell_app/services/socket_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => SocketService())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bell App',
        home: LoginScreen(),
      ),
    );
  }
}
