import 'package:flutter/material.dart';

class PengembalianCard extends StatelessWidget {
  const PengembalianCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(color: Colors.grey[300]!, width: 1)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Toko Sinar Jaya Abadi',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.apply(color: Colors.black),
            ),
            const SizedBox(
              height: 4.0,
            ),
            Container(
              padding: const EdgeInsets.all(7.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[200]),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                      flex: 1,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.network(
                            'https://static.sehatq.com/content/review/product/image/767120211206100834.jpeg',
                            fit: BoxFit.cover,
                          ))),
                  const SizedBox(width: 9.0),
                  Flexible(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Minuman Sehat Bergizi, 0 Kalori',
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.apply(color: Colors.black),
                          ),
                          Text(
                            'Qty : 3',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.apply(color: Colors.grey[700]),
                          ),
                        ],
                      ))
                ],
              ),
            ),
            const SizedBox(
              height: 6.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                    flex: 1,
                    child: Text(
                      'Tanggal pengembalian:\n02 Mei 2023',
                      style: Theme.of(context).textTheme.bodySmall,
                    )),
                Flexible(
                    flex: 1,
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text('Beli Lagi')))
              ],
            )
          ],
        ),
      ),
    );
  }
}
