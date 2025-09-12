import 'dart:convert';
import 'package:crypto/crypto.dart';

class SocketConstants {
  static const String uri = '';
  static const String secret = '';
}

class SocketEvents {
  static const String userGeneratePostEvent = 'userGeneratePostEvent';
  static const String authEvent = 'authenticate';
}

class SocketChannels {
  static String userGeneratePostChannel(String userId) => 'user.$userId';
}

String generateUserAuthSignature(
  String socketId,
  String userId,
  String secret,
) {
  final userData = jsonEncode({'id': userId});
  final authString = '$socketId::user::$userData';
  final hmacSha256 = Hmac(sha256, utf8.encode(secret));
  final digest = hmacSha256.convert(utf8.encode(authString));
  return digest.toString();
}

String generatePrivateChannelSignature(
  String socketId,
  String channelName,
  String secret,
) {
  final authString = '$socketId:$channelName';
  final hmacSha256 = Hmac(sha256, utf8.encode(secret));
  final digest = hmacSha256.convert(utf8.encode(authString));
  return digest.toString();
}
