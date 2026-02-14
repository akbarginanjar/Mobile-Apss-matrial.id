import 'dart:convert';

import 'package:mobile_balanja_id/balanja_app/global_resource.dart';
import 'package:mobile_balanja_id/balanja_app/services/chat_service.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';

class ChatController extends GetxController {
  final ChatService service = ChatService();

  final String roomId;
  final int userId;
  var isSending = false.obs;

  /// INPUT
  final TextEditingController messageC = TextEditingController();

  final ScrollController scrollC = ScrollController();

  late RxBool showProduk;

  ChatController({
    required this.roomId,
    required this.userId,
    required bool showProduk,
  }) {
    this.showProduk = showProduk.obs;
  }

  void closeProduk() {
    showProduk.value = false;
  }

  var messages = <Map<String, dynamic>>[].obs;
  var isLoading = false.obs;

  late PusherChannelsFlutter pusher;

  @override
  void onInit() {
    super.onInit();
    fetchMessages();
    initPusher();
  }

  @override
  void onClose() {
    scrollC.dispose();
    pusher.unsubscribe(channelName: 'chat-room.$roomId');
    pusher.disconnect();
    super.onClose();
  }

  void scrollToBottom() {
    if (!scrollC.hasClients) return;

    scrollC.animateTo(
      scrollC.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  /// =====================
  /// GET CHAT LIST
  /// =====================
  Future<void> fetchMessages() async {
    try {
      isLoading.value = true;

      final response = await service.getMessages(
        roomId: roomId,
        userId: userId,
      );

      if (response.statusCode == 200) {
        messages.value = List<Map<String, dynamic>>.from(response.body)
            .map((e) => {...e, 'message': _normalizeMessage(e['message'])})
            .toList();

        /// scroll ke bawah setelah render
        Future.delayed(const Duration(milliseconds: 300), scrollToBottom);
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> sendMessage({int? penyimpananId}) async {
    final text = messageC.text.trim();
    if (text.isEmpty) return;

    final body = {
      'message': text,
      if (penyimpananId != null) 'penyimpanan_id': penyimpananId,
    };

    try {
      isSending.value = true;

      final response = await service.sendChatMessage(roomId, userId, body);

      if (response.statusCode == 200) {
        /// kosongkan input
        messageC.clear();

        /// ❗ JANGAN TAMBAH KE messages
        /// biar realtime dari PUSHER
      } else {
        Get.snackbar('Gagal', 'Pesan gagal dikirim');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isSending.value = false;
    }
  }

  Future<void> initPusher() async {
    pusher = PusherChannelsFlutter.getInstance();

    await pusher.init(
      apiKey: 'f41375b55c88d3f86d27',
      cluster: 'ap1',
      onConnectionStateChange: (currentState, previousState) {
        debugPrint('PUSHER STATE: $previousState → $currentState');
      },
      onError: (message, code, error) {
        debugPrint('PUSHER ERROR: $message ($code) $error');
      },
      onEvent: onEvent,
    );

    /// 1️⃣ CONNECT DULU
    await pusher.connect();

    /// 2️⃣ BARU SUBSCRIBE CHANNEL
    await pusher.subscribe(channelName: 'chat-room.$roomId');
  }

  void onEvent(PusherEvent event) {
    if (event.eventName == 'new-message') {
      final payload = jsonDecode(event.data);
      final message = Map<String, dynamic>.from(payload['message']);

      messages.add(message);

      scrollToBottom();
    }
  }

  String _normalizeMessage(dynamic message) {
    if (message is String) return message;
    if (message is Map && message['text'] != null) {
      return message['text'].toString();
    }
    return '';
  }
}
