import 'package:mobile_balanja_id/balanja_app/views/notifikasi_screen/notif_card.dart';
import 'package:flutter/material.dart';

class NotifikasiScreen extends StatefulWidget {
  const NotifikasiScreen({super.key});

  @override
  State<NotifikasiScreen> createState() => _NotifikasiScreenState();
}

class _NotifikasiScreenState extends State<NotifikasiScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notifikasi')),
      body: ListView.builder(
        itemCount: 8,
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 7.0),
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.only(top: index == 0 ? 4.0 : 0, bottom: 4.0),
          child: const NotifCard(),
        ),
      ),
    );
  }
}
