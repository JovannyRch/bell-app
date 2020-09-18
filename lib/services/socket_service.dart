import 'package:bell_app/global/enviroment.dart';
import 'package:flutter/foundation.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

enum ServerStatus { Online, Offline, Connecting }

class SocketService with ChangeNotifier {
  ServerStatus _serverStatus = ServerStatus.Connecting;
  IO.Socket _socket;
  bool _newNotification = false;
  bool _isSendingNotification = false;
  String _name = "";

  bool get isSendingNotification => this._isSendingNotification;
  set isSendingNotification(val) {
    this._isSendingNotification = val;
    notifyListeners();
  }

  String get name => this._name;

  SocketService() {
    _initConfig();
  }
  bool get isNewNotification => this._newNotification;
  ServerStatus get serverStatus => this._serverStatus;
  IO.Socket get socket => this._socket;
  Function get emit => this._socket.emit;

  set isNewNotification(val) {
    this._newNotification = val;
    notifyListeners();
  }

  void _initConfig() {
    _socket = IO.io(Enviroment.socketUrl, {
      'transports': ['websocket'],
      'autoConnect': true,
    });

    _socket.on('connect', (_) {
      this._serverStatus = ServerStatus.Online;
      print('$_serverStatus');
      notifyListeners();
    });

    _socket.on('disconnect', (_) {
      this._serverStatus = ServerStatus.Online;
      notifyListeners();
    });

    _socket.on('send-message', (payload) {
      print("$payload");
      notifyListeners();
    });

    _socket.on('notification', (payload) {
      print("Nueva notificacion");
      this._name = payload;
      this._newNotification = true;
      notifyListeners();
    });
  }
}
