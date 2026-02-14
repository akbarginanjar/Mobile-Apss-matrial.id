import 'package:mobile_balanja_id/balanja_app/controllers/chat_controller.dart';
import 'package:mobile_balanja_id/balanja_app/global_resource.dart';

class ChatScreen extends StatelessWidget {
  final String roomId;
  final int userId;
  final String namaToko;
  final VarianBarang produk;
  final bool showProduk;

  const ChatScreen({
    super.key,
    required this.roomId,
    required this.userId,
    required this.namaToko,
    required this.produk,
    required this.showProduk,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(
      ChatController(roomId: roomId, userId: userId, showProduk: showProduk),
    );

    return Scaffold(
      appBar: AppBar(title: Text(namaToko)),
      body: Column(
        children: [
          /// CHAT LIST
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              return ListView.builder(
                reverse: true,
                padding: const EdgeInsets.symmetric(vertical: 12),
                itemCount: controller.messages.length,
                itemBuilder: (context, index) {
                  final msg = controller
                      .messages[controller.messages.length - 1 - index];

                  final isMe = msg['sender_id'].toString() == userId.toString();

                  final hasBarang = msg['barang'] != null;

                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    child: Align(
                      alignment: isMe
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.75,
                        ),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: isMe
                                ? Theme.of(context).colorScheme.primary
                                  // ignore: deprecated_member_use
                                  .withOpacity(0.5) // hijau chat modern
                                : dark,
                            borderRadius: BorderRadius.only(
                              topLeft: const Radius.circular(16),
                              topRight: const Radius.circular(16),
                              bottomLeft: Radius.circular(isMe ? 16 : 4),
                              bottomRight: Radius.circular(isMe ? 4 : 16),
                            ),
                            boxShadow: [
                              BoxShadow(
                                // ignore: deprecated_member_use
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 6,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                /// TEXT
                                Text(
                                  msg['message'] ?? '',
                                  style: const TextStyle(
                                    fontSize: 15,
                                    height: 1.4,
                                  ),
                                ),

                                /// BARANG PREVIEW
                                if (hasBarang) ...[
                                  const SizedBox(height: 10),
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary
                                          // ignore: deprecated_member_use
                                          .withOpacity(0.3),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                          child: Image.network(
                                            msg['barang']['foto'][0]['path'],
                                            width: 48,
                                            height: 48,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '${msg['barang']['nama_barang']} - ${msg['barang']['varian']}',
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 13,
                                                ),
                                              ),
                                              Text(
                                                toCurrency(
                                                  msg['barang']['harga'],
                                                ),
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: textTheme,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            }),
          ),

          Obx(() {
            if (!controller.showProduk.value) {
              return const SizedBox();
            }
            return Container(
              margin: const EdgeInsets.fromLTRB(12, 8, 12, 6),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: dark,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: dark2),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /// FOTO PRODUK
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      '${produk.photo[0].path}',
                      width: 52,
                      height: 52,
                      fit: BoxFit.cover,
                    ),
                  ),

                  const SizedBox(width: 12),

                  /// INFO PRODUK
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${produk.nama} - ${produk.varian}',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          toCurrency(produk.harga!),
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: primary,
                          ),
                        ),
                      ],
                    ),
                  ),

                  /// CLOSE ICON
                  InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {
                      controller.closeProduk();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      child: const Icon(
                        Icons.close,
                        size: 20,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),

          /// INPUT (sementara UI dulu)
          Container(
            padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
            decoration: BoxDecoration(color: Colors.transparent),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller.messageC,
                    minLines: 1,
                    maxLines: 4,
                    decoration: InputDecoration(
                      hintText: 'Tulis pesan...',
                      hintStyle: TextStyle(color: Colors.grey.shade500),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      filled: true,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Obx(
                  () => controller.isSending.value
                      ? const Padding(
                          padding: EdgeInsets.all(8),
                          child: SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          ),
                        )
                      : InkWell(
                          borderRadius: BorderRadius.circular(24),
                          onTap: () {
                            if (controller.showProduk.value == true) {
                              controller.sendMessage(penyimpananId: produk.id);
                            } else {
                              controller.sendMessage();
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: primary,
                            ),
                            child: const Icon(
                              Icons.send,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
