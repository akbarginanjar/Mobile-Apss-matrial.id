import 'package:mobile_balanja_id/balanja_app/config/theme.dart';
import 'package:mobile_balanja_id/balanja_app/views/cart_screen/cart_card.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Keranjang', style: TextStyle(color: textdark)),
        backgroundColor: dark,
        iconTheme: IconThemeData(color: primary),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite),
            alignment: Alignment.centerRight,
            color: primary,
            padding: const EdgeInsets.only(right: 20),
            iconSize: 26,
          ),
        ],
      ),
      body: Center(child: Text('Fitur Belum Tersedia')),
    );
  }
}
