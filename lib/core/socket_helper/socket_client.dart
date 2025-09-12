import 'dart:developer';
import 'package:postify/core/socket_helper/socket_constants.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketClient {
  static final SocketClient instance = SocketClient._internal();
  SocketClient._internal();
  factory SocketClient() => instance;

  late IO.Socket socket;

  void init({required String userId, required String socketId}) {
    log('Initializing Socket.IO...');

    socket = IO.io(
      SocketConstants.uri,
      IO.OptionBuilder()
          .setTransports(['websocket'])
          .enableAutoConnect()
          .build(),
    );

    socket.onConnect((_) {
      log('Socket Connected');
      final signature = generateUserAuthSignature(
        socketId,
        userId,
        SocketConstants.secret,
      );

      emit(SocketEvents.authEvent, {'userId': userId, 'signature': signature});

      final channel = SocketChannels.userGeneratePostChannel(userId);
      emit(SocketEvents.userGeneratePostEvent, channel);
    });

    socket.onDisconnect((_) {
      log('Socket Disconnected');
    });

    socket.onConnectError((err) {
      log('Socket Connect Error: $err');
    });

    socket.onError((err) {
      log('Socket Error: $err');
    });
  }

  void subscribe(String eventName, Function(dynamic) onEvent) {
    socket.on(eventName, (data) {
      log('Event [$eventName] received: $data');
      onEvent(data);
    });
  }

  void emit(String eventName, dynamic data) {
    log('Emit [$eventName]: $data');
    socket.emit(eventName, data);
  }

  void unsubscribe(String eventName) {
    socket.off(eventName);
  }

  void disconnect() {
    socket.disconnect();
  }
}
