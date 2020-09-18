import 'package:bell_app/screens/auth/login.dart';
import 'package:bell_app/screens/auth/register.dart';
import 'package:bell_app/screens/home/home_screen.dart';
import 'package:bell_app/screens/home/no_premium_screen.dart';

final routes = {
  '/login': (context) => LoginScreen(),
  '/register': (context) => RegisterScreen(),
  '/home': (context) => HomeScreen(),
  '/noPremium': (context) => NoPremiumScreen(),
};
