import 'package:bell_app/const/conts.dart';
import 'package:bell_app/routes/routes.dart';
import 'package:bell_app/services/auth_service.dart';
import 'package:bell_app/services/socket_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  String initialRoute = "/login";
  runApp(MyApp(initialRoute));
}

class MyApp extends StatelessWidget {
  final initialRoute;
  MyApp(this.initialRoute);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
        ChangeNotifierProvider(create: (_) => SocketService()),
      ],
      child: MaterialApp(
        theme: ThemeData(primaryColor: kBaseColor),
        debugShowCheckedModeBanner: false,
        title: 'Bell App',
        routes: routes,
        initialRoute: initialRoute,
      ),
    );
  }
}
