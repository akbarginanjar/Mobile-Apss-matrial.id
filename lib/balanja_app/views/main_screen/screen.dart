import 'package:mobile_balanja_id/balanja_app/config/theme.dart';
import 'package:mobile_balanja_id/balanja_app/controllers/main_controller.dart';
import 'package:mobile_balanja_id/balanja_app/views/home_screen/screen.dart';
import 'package:mobile_balanja_id/balanja_app/views/cart_screen/cart_screen.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_balanja_id/balanja_app/views/pesanan_screen/button_views/screen.dart';
import 'package:mobile_balanja_id/balanja_app/views/pesanan_screen/screen.dart';
import 'package:mobile_balanja_id/balanja_app/views/profile_screen/screen.dart';
import 'package:mobile_balanja_id/balanja_app/views/transaksi/screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Widget> _screens = [
    const HomeScreen(),
    PilihTransaksiScreen(),
    const CartScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      init: MainController(),
      builder: (value) {
        return Scaffold(
          body: _screens[value.index],
          bottomNavigationBar: BottomNavigationBar(
            elevation: 0,
            iconSize: 25,
            type: BottomNavigationBarType.fixed,
            backgroundColor: dark,
            onTap: (v) {
              value.changeIndex(v);
            },
            currentIndex: value.index,
            enableFeedback: true,
            selectedItemColor: Theme.of(context).colorScheme.primary,
            unselectedItemColor: textdark,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag_outlined),
                label: 'Pesanan',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_outlined),
                label: 'Keranjang',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profil',
              ),
            ],
          ),
        );
      },
    );
  }
}
