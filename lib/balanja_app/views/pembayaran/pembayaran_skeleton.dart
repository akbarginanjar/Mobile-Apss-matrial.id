import 'package:flutter/material.dart';
import 'package:mobile_balanja_id/balanja_app/global_resource.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:google_fonts/google_fonts.dart';

class PembayaranSkeleton extends StatelessWidget {
  const PembayaranSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      effect: ShimmerEffect(
        baseColor: Colors.grey.shade800,
        highlightColor: Colors.grey.shade700,
      ),
      child: Scaffold(
        backgroundColor: dark,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // HEADER INVOICE
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('No Invoice'),
                    SizedBox(height: 6),
                    Text(
                      'INVMTRIDT-0366-100126-323',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text('Status'),
                    SizedBox(height: 6),
                    Text('diproses', style: TextStyle(fontSize: 16)),
                    SizedBox(height: 16),
                    Text('Total Pembayaran'),
                    SizedBox(height: 6),
                    Text(
                      'Rp 119.500',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
