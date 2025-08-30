import 'dart:convert';

import 'package:crypto/crypto.dart';

class PusherConstants {
  static const String apiKey = 'f70579b6acfb78ea6254';
  static const String appId = '1858783';
  static const String secret = '1088209836c9cac36bde';
  static const String cluster = 'eu';
}

class PusherEvents {
  static const String orderStatus = 'user-order-event';
}

class PusherChannels {
  static String status(String userId) => 'private-user-channel.$userId';
}

String generateUserAuthSignature(String socketId, String userId, String secret) {
  final userData = jsonEncode({'id': userId});
  final authString = '$socketId::user::$userData';
  final hmacSha256 = Hmac(sha256, utf8.encode(secret));
  final digest = hmacSha256.convert(utf8.encode(authString));
  return digest.toString();
}

String generatePrivateChannelSignature(String socketId, String channelName, String secret) {
  final authString = '$socketId:$channelName';
  final hmacSha256 = Hmac(sha256, utf8.encode(secret));
  final digest = hmacSha256.convert(utf8.encode(authString));
  return digest.toString();
}