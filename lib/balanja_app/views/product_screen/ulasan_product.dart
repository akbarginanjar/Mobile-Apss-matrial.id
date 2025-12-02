import 'package:flutter/material.dart';
import 'package:mobile_balanja_id/balanja_app/config/theme.dart';

class RatingUlasanWidget extends StatelessWidget {
  const RatingUlasanWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: dark,
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // TITLE
          Text(
            "Rating & Ulasan Produk",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),

          const SizedBox(height: 10),

          // TOP RATING SUMMARY
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // BIG RATING NUMBER
              Text(
                "4.9",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: Colors.yellow[800],
                ),
              ),

              const SizedBox(width: 12),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: List.generate(5, (index) {
                      return Icon(
                        index < 4 ? Icons.star : Icons.star_half,
                        size: 20,
                        color: Colors.yellow[700],
                      );
                    }),
                  ),
                  const SizedBox(height: 5),
                  Text("928 ulasan", style: TextStyle(fontSize: 13)),
                ],
              ),
            ],
          ),

          const SizedBox(height: 10),
          Divider(color: Colors.grey.shade200, thickness: 1),
          const SizedBox(height: 10),

          // REVIEW LIST ITEMS
          reviewItem(
            context,
            avatar: "https://i.pravatar.cc/150?img=11",
            name: "Kidam Kusnandi",
            rating: 5,
            comment: "Barang sangat bagus, pengiriman cepat, packing rapi!",
            time: "2 hari yang lalu",
          ),

          reviewItem(
            context,
            avatar: "https://i.pravatar.cc/150?img=33",
            name: "Akbar Ginanjar",
            rating: 4,
            comment:
                "Sesuai deskripsi, kualitas sesuai harga. Recommended seller!",
            time: "1 minggu yang lalu",
          ),

          reviewItem(
            context,
            avatar: "https://i.pravatar.cc/150?img=45",
            name: "Nandi Kuskidam",
            rating: 3,
            comment: "Good",
            time: "3 minggu yang lalu",
          ),
        ],
      ),
    );
  }

  // 🟡 REVIEW ITEM WIDGET
  Widget reviewItem(
    BuildContext context, {
    required String avatar,
    required String name,
    required int rating,
    required String comment,
    required String time,
  }) {
    return Card(
      elevation: 0,
      // color: dark2,
      margin: EdgeInsets.symmetric(horizontal: 0, vertical: 3),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // Avatar
                SizedBox(
                  height: 30,
                  width: 30,
                  child: CircleAvatar(
                    radius: 22,
                    backgroundImage: NetworkImage(avatar),
                  ),
                ),
                const SizedBox(width: 10),
                // Name
                Text(
                  name,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                ),
              ],
            ),

            const SizedBox(height: 10),

            // Rating stars
            Row(
              children: List.generate(5, (index) {
                return Icon(
                  index < rating ? Icons.star : Icons.star_border,
                  size: 18,
                  color: Colors.yellow[700],
                );
              }),
            ),

            const SizedBox(height: 4),

            // Comment
            Text(comment, style: TextStyle(fontSize: 14)),

            const SizedBox(height: 6),

            // Time
            Text(time, style: TextStyle(fontSize: 12, color: Colors.grey[500])),
          ],
        ),
      ),
    );
  }
}
