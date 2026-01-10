import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_balanja_id/balanja_app/controllers/ulasan_controller.dart';
import 'package:mobile_balanja_id/balanja_app/global_resource.dart';

class UlasanView extends StatelessWidget {
  final String barangId;
  UlasanView({super.key, required this.barangId});

  final controller = Get.put(UlasanController());

  @override
  Widget build(BuildContext context) {
    // LOAD SEKALI SAJA
    controller.loadUlasan(barangId);

    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      return Container(
        color: dark,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// TITLE
            Text(
              'Rating & Ulasan Produk',
              style: TextStyle(color: textTheme, fontSize: 18),
            ),

            const SizedBox(height: 12),

            /// SUMMARY
            Row(
              children: [
                Text(
                  '${controller.summary['rata_rating'] ?? 0}.0',
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                    color: textTheme,
                  ),
                ),
                const SizedBox(width: 6),
                Text('/5', style: TextStyle(color: Colors.grey)),
                const SizedBox(width: 12),
                ratingStars(controller.summary['rata_rating'] ?? 0),
              ],
            ),

            Text(
              'Berdasarkan ${controller.summary['total_ulasan'] ?? 0} ulasan',
              style: const TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 24),

            /// LIST ULASAN
            ...controller.ulasans.map((ulasan) {
              final member = ulasan['member'] ?? {};
              final media = ulasan['media'] as List? ?? [];

              return Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// HEADER
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                          child: Text(
                            (member['nama_lengkap'] ?? 'A')[0],
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          member['nama_lengkap'] ?? '-',
                          style: TextStyle(
                            color: textTheme,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 6),

                    /// STARS
                    ratingStars(ulasan['rating'] ?? 0),

                    const SizedBox(height: 6),

                    /// COMMENT
                    Text(
                      ulasan['komentar'] ?? '-',
                      style: const TextStyle(color: Colors.white),
                    ),

                    const SizedBox(height: 8),

                    /// MEDIA
                    if (media.isNotEmpty)
                      Row(
                        children: media.map((m) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(6),
                              child: Image.network(
                                m['url'],
                                width: 48,
                                height: 48,
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        }).toList(),
                      ),

                    const SizedBox(height: 6),

                    /// TIME
                    Text(
                      timeAgo(ulasan['tanggal']),
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
              );
            }).toList(),
          ],
        ),
      );
    });
  }
}

String timeAgo(String date) {
  final time = DateTime.parse(date);
  final diff = DateTime.now().difference(time);

  if (diff.inMinutes < 1) {
    return 'Baru saja';
  } else if (diff.inMinutes < 60) {
    return '${diff.inMinutes} menit yang lalu';
  } else if (diff.inHours < 24) {
    return '${diff.inHours} jam yang lalu';
  } else {
    return '${diff.inDays} hari yang lalu';
  }
}

Widget ratingStars(int rating) {
  return Row(
    children: List.generate(5, (index) {
      return Icon(
        index < rating ? Icons.star : Icons.star_border,
        color: Colors.amber,
        size: 16,
      );
    }),
  );
}
