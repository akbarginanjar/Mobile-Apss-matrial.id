import 'dart:io';

import 'package:mobile_balanja_id/balanja_app/global_resource.dart';

class ChatService extends GetConnect {
  var tokens = GetStorage().read('tokens');

  Future<Response> createRoomChat(body) {
    final header = {
      'secret':
          'aKndsan23928h98hKJbkjwlKHD9dsbjwiobqUJGHBDWHvkHSJQUBSQOPSAJHVwoihdapq',
      'Author': 'bearer $tokens',
      'device': 'mobile',
    };
    return post('${Base.url}/v1/chat/room', headers: header, body);
  }

  Future<Response> getMessages({required String roomId, required int userId}) {
    return get(
      '${Base.url}/v1/chat/room/$roomId/messages?user_id=$userId',
      headers: {
        'secret':
            'aKndsan23928h98hKJbkjwlKHD9dsbjwiobqUJGHBDWHvkHSJQUBSQOPSAJHVwoihdapq',
        'Author': 'bearer $tokens',
        'device': 'mobile',
      },
    );
  }

  Future<Response> sendChatMessage(
    String roomId,
    int userId,
    Map<String, dynamic> body,
  ) {
    final header = {
      'secret':
          'aKndsan23928h98hKJbkjwlKHD9dsbjwiobqUJGHBDWHvkHSJQUBSQOPSAJHVwoihdapq',
      'Author': 'bearer $tokens',
      'device': 'mobile',
    };

    return post(
      '${Base.url}/v1/chat/room/$roomId/message?user_id=$userId',
      headers: header,
      body,
    );
  }
}
