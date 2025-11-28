import 'package:flutter/material.dart';

class CartImage extends StatelessWidget {
  const CartImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.red,
        image: const DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
                'http://api.matrial.id/barang/photo/1763453329pasir.jpg')),
      ),
    );
  }
}
