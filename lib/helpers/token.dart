import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final storage = new FlutterSecureStorage();
Future saveToken(String token) async {
  return await storage.write(key: 'token', value: token);
}

Future getToken() async {
  return await storage.read(key: 'token');
}

Future deleteToken() async {
  return await storage.delete(key: 'token');
}
