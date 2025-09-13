class SocketConstants {
  static const String uri =
      'https://postify-api-d0a4haegh6ascugv.uaenorth-01.azurewebsites.net';
}

class SocketEvents {
  static const String initUser = 'init_user';
  static const String generatePost = 'generate_request';
  static const String ack = 'ack';
  static const String error = 'error';
  static const String botTyping = 'bot_typing';
  static const String botMessage = 'bot_message';
  static const String toggleHashtags = 'toggle_hashtags';
  static const String toggleEmojis = 'toggle_emojis';
  static const String publishPost = 'publish_post';
}
