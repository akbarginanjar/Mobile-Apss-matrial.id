import 'package:flutter/material.dart';

import '../../pengembalian_card.dart';

class PengembalianTabview extends StatefulWidget {
  const PengembalianTabview({super.key});

  @override
  State<PengembalianTabview> createState() => _PengembalianTabviewState();
}

class _PengembalianTabviewState extends State<PengembalianTabview> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListView.builder(
              itemCount: 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 7.0),
              itemBuilder: (context, index) => Padding(
                    padding:
                        EdgeInsets.only(top: index == 0 ? 7.0 : 0, bottom: 7.0),
                    child: const PengembalianCard(),
                  ))
        ],
      ),
    );
  }
}
