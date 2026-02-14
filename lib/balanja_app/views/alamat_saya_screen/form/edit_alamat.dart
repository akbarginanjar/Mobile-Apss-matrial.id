import 'package:dropdown_search/dropdown_search.dart';

import 'package:mobile_balanja_id/balanja_app/global_resource.dart';
import 'package:mobile_balanja_id/balanja_app/models/alamat_model.dart';
import 'package:mobile_balanja_id/balanja_app/controllers/alamat_controller.dart';

// ignore: must_be_immutable
class EditAlamatScreen extends StatelessWidget {
  final AlamatController alamatController = Get.put(AlamatController());
  final Alamat alamat;

  late TextEditingController namaLengkap;
  late TextEditingController nomorHp;
  late TextEditingController labelAlamat;
  late TextEditingController detailAlamat;
  late TextEditingController catatan;
  late TextEditingController kodepos;

  final GlobalKey<FormState> form = GlobalKey<FormState>();

  EditAlamatScreen({super.key, required this.alamat}) {
    namaLengkap = TextEditingController(text: alamat.namaKontak);
    nomorHp = TextEditingController(text: alamat.nomorKontak);
    labelAlamat = TextEditingController(text: alamat.labelAlamat);
    detailAlamat = TextEditingController(text: alamat.alamat);
    catatan = TextEditingController(text: alamat.catatan);
    kodepos = TextEditingController(text: alamat.postalCode);

    alamatController.selectedGender.value = "";
    alamatController.selectProvinsi = alamat.provinsiId;
    alamatController.selectKabKot = alamat.kabKotaId;
    alamatController.selectKecamatan = alamat.kecamatanId;
    alamatController.selectKelurahan = alamat.desaId;

    alamatController.latC.text = alamat.latitude ?? "";
    alamatController.longC.text = alamat.longitude ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.black38,
        elevation: 3,
        centerTitle: true,
        title: Text('Edit Alamat', style: GoogleFonts.montserrat()),
        iconTheme: IconThemeData(color: primary),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(11),
        child: Form(
          key: form,
          child: ListView(
            children: [
              const SizedBox(height: 10),
              const Text('KONTAK', style: TextStyle(fontSize: 12)),
              const SizedBox(height: 10),
              SizedBox(
                height: 50,
                child: TextFormField(
                  controller: namaLengkap,
                  decoration: const InputDecoration(
                    label: Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Text('Nama Lengkap', style: TextStyle(fontSize: 14)),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 50,
                child: TextFormField(
                  controller: nomorHp,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  decoration: const InputDecoration(
                    label: Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Text('Nomor HP', style: TextStyle(fontSize: 14)),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text('ALAMAT', style: TextStyle(fontSize: 12)),
              const SizedBox(height: 10),
              SizedBox(
                height: 50,
                child: TextFormField(
                  controller: labelAlamat,
                  decoration: const InputDecoration(
                    hintText: 'Rumah, Kantor, Apartemen, Kos',
                    label: Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Text('Label Alamat', style: TextStyle(fontSize: 14)),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Obx(() => DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      labelText: "Jenis Kelamin",
                      border: OutlineInputBorder(),
                    ),
                    initialValue: alamatController.selectedGender.value.isEmpty
                        ? null
                        : alamatController.selectedGender.value,
                    hint: const Text("Pilih jenis kelamin"),
                    items: alamatController.genderList.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      if (value != null) {
                        alamatController.setGender(value);
                      }
                    },
                  )),
              const SizedBox(height: 10),
              Obx(() => DropdownSearch<Province>(
                    dropdownDecoratorProps: DropDownDecoratorProps(
                      dropdownSearchDecoration: const InputDecoration(
                        labelText: "Provinsi",
                        hintText: "Pilih Provinsi",
                        filled: true,
                      ),
                    ),
                    items: alamatController.provinces.toList(),
                    itemAsString: (Province province) => province.name,
                    onChanged: (Province? province) {
                      alamatController.changeSelectProvinsi(province!.id);
                    },
                  )),
              const SizedBox(height: 13),
              Obx(() => DropdownSearch<KabKot>(
                    dropdownDecoratorProps: DropDownDecoratorProps(
                      dropdownSearchDecoration: const InputDecoration(
                        labelText: "Kab/Kot",
                        hintText: "Pilih Kab/Kot",
                        filled: true,
                      ),
                    ),
                    items: alamatController.kabkots.toList(),
                    itemAsString: (KabKot kabkot) => kabkot.name,
                    onChanged: (KabKot? kabkot) {
                      alamatController.changeSelectKabKot(kabkot!.id);
                    },
                  )),
              const SizedBox(height: 13),
              Obx(() => DropdownSearch<Kacamatan>(
                    dropdownDecoratorProps: DropDownDecoratorProps(
                      dropdownSearchDecoration: const InputDecoration(
                        labelText: "Kecamatan",
                        hintText: "Pilih Kecamatan",
                        filled: true,
                      ),
                    ),
                    items: alamatController.kecamatans.toList(),
                    itemAsString: (Kacamatan kecamatan) => kecamatan.name,
                    onChanged: (Kacamatan? kecamatan) {
                      alamatController.changeSelectKecamatan(kecamatan!.id);
                    },
                  )),
              const SizedBox(height: 13),
              Obx(() => DropdownSearch<KelurahanModel>(
                    dropdownDecoratorProps: DropDownDecoratorProps(
                      dropdownSearchDecoration: const InputDecoration(
                        labelText: "Kelurahan",
                        hintText: "Pilih Kelurahan",
                        filled: true,
                      ),
                    ),
                    items: alamatController.kelurahans.toList(),
                    itemAsString: (KelurahanModel kelurahan) => kelurahan.name,
                    onChanged: (KelurahanModel? kelurahan) {
                      alamatController.changeSelectKelurahan(kelurahan!.id);
                    },
                  )),
              const SizedBox(height: 10),
              TextFormField(
                controller: alamatController.latC,
                decoration: const InputDecoration(
                  label: Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Text('Latitude', style: TextStyle(fontSize: 14)),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: alamatController.longC,
                decoration: const InputDecoration(
                  label: Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Text('Longitude', style: TextStyle(fontSize: 14)),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: alamatController.getLocation,
                child: Text(
                  "Ambil Lokasi Saat Ini",
                  style: GoogleFonts.montserrat(color: textTheme),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: kodepos,
                decoration: const InputDecoration(
                  label: Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Text('Kode POS', style: TextStyle(fontSize: 14)),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: detailAlamat,
                maxLines: 3,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  label: Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Text('Detail Alamat', style: TextStyle(fontSize: 14)),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: catatan,
                decoration: const InputDecoration(
                  hintText: 'Catatan (Opsional)',
                  label: Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Text(
                      'Catatan',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 45,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primary,
                    surfaceTintColor: primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () {
                    alamatController.updateAlamat(
                      idAlamat: alamat.id!,
                      labelAlamat: labelAlamat.text,
                      idProvinsi: alamatController.selectProvinsi!,
                      idKabKot: alamatController.selectKabKot!,
                      idKecamatan: alamatController.selectKecamatan!,
                      idKelurahan: alamatController.selectKelurahan!,
                      detailAlamat: detailAlamat.text,
                      nomorHp: nomorHp.text,
                      namaLengkap: namaLengkap.text,
                      jenisAlamat: alamat.jenisAlamat ?? "utama",
                      catatan: catatan.text,
                      lat: alamatController.latC.text,
                      long: alamatController.longC.text,
                      kodepos: kodepos.text,
                      jenisKelamin: alamatController.selectedGender.value,
                    );
                  },
                  child: Text(
                    'Simpan Perubahan',
                    style: GoogleFonts.montserrat(
                      color: textTheme,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
