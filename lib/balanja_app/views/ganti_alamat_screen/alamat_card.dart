import 'package:mobile_balanja_id/balanja_app/config/theme.dart';
import 'package:mobile_balanja_id/balanja_app/controllers/checkout_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlamatCard extends StatelessWidget {
  final String name;
  final String noTelp;
  final String alamat;
  final String labelAlamat;
  final int idProvinsi;
  final int idKabKot;
  final int idKecamatan;
  final int idKelurahan;
  final int value;
  const AlamatCard({
    super.key,
    required this.name,
    required this.noTelp,
    required this.alamat,
    required this.labelAlamat,
    required this.value,
    required this.idProvinsi,
    required this.idKabKot,
    required this.idKecamatan,
    required this.idKelurahan,
  });

  @override
  Widget build(BuildContext context) {
    final CheckoutController c = Get.find();

    return InkWell(
      onTap: () => c.changeSelectAlamat(
        value,
        name,
        noTelp,
        alamat,
        labelAlamat,
        idProvinsi,
        idKabKot,
        idKecamatan,
        idKelurahan,
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: dark, width: 1.0)),
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.all(0),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                labelAlamat,
                style: TextStyle(
                  color: primary,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '$name | $noTelp',
                maxLines: 2,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          subtitle: Text(alamat),
          trailing: Container(
            width: MediaQuery.of(context).size.width / 11.0,
            alignment: Alignment.topRight,
            child: Checkbox(
              activeColor: Theme.of(context).colorScheme.primary,
              value: c.selectAlamat == value,
              onChanged: (v) => c.changeSelectAlamat(
                value,
                name,
                noTelp,
                alamat,
                labelAlamat,
                idProvinsi,
                idKabKot,
                idKecamatan,
                idKelurahan,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
