import 'package:mobile_balanja_id/balanja_app/controllers/alamat_controller.dart';
import 'package:mobile_balanja_id/balanja_app/global_resource.dart';
import 'package:mobile_balanja_id/balanja_app/models/alamat_model.dart';
import 'package:dropdown_search/dropdown_search.dart';

// ignore: must_be_immutable
class AlamatScreen extends StatelessWidget {
  final AlamatController alamatController = Get.put(AlamatController());
  TextEditingController namaLengkap = TextEditingController();
  TextEditingController nomorHp = TextEditingController();
  TextEditingController labelAlamat = TextEditingController();
  TextEditingController detailAlamat = TextEditingController();
  TextEditingController catatan = TextEditingController();
  TextEditingController kodepos = TextEditingController();
  final GlobalKey<FormState> form = GlobalKey<FormState>();
  AlamatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.black38,
        elevation: 3,
        centerTitle: true,
        title: Text('Alamat Baru', style: GoogleFonts.montserrat()),
        iconTheme: IconThemeData(
          color: primary, // Ubah warna ikon kembali di sini
        ),
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
          child: ListView(
            children: [
              const SizedBox(height: 10),
              const Text('KONTAK', style: TextStyle(fontSize: 12)),
              const SizedBox(height: 10),
              SizedBox(
                height: 50,
                child: TextFormField(
                  controller: namaLengkap,
                  decoration: InputDecoration(
                    label: const Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Text(
                        'Nama Lengkap',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    fillColor: primary,
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
                  decoration: InputDecoration(
                    label: const Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Text('Nomor HP', style: TextStyle(fontSize: 14)),
                    ),
                    fillColor: primary,
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
                  decoration: InputDecoration(
                    hintText: 'Rumah, Kantor, Apartemen, Kos',
                    label: const Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Text(
                        'Label Alamat',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    fillColor: primary,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Obx(
                () => DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: "Jenis Kelamin",
                    border: OutlineInputBorder(),
                  ),

                  value: alamatController.selectedGender.value.isEmpty
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
                ),
              ),

              const SizedBox(height: 10),
              Obx(() {
                return DropdownSearch<Province>(
                  dropdownDecoratorProps: DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                      labelText: "Provinsi",
                      hintText: "Pilih Provinsi",
                      filled: true,
                    ),
                  ),
                  popupProps: PopupProps.bottomSheet(
                    showSearchBox: true,
                    fit: FlexFit.loose,
                    title: const Padding(
                      padding: EdgeInsets.only(left: 8, top: 8),
                      child: Text(
                        'Cari Provinsi',
                        style: TextStyle(color: Colors.grey, fontSize: 13),
                      ),
                    ),
                    containerBuilder: (ctx, popupWidget) {
                      return Container(color: dark2, child: popupWidget);
                    },
                  ),
                  items: alamatController.provinces.toList(),
                  itemAsString: (Province province) => province.name,
                  onChanged: (Province? province) {
                    alamatController.changeSelectProvinsi(province!.id);
                  },
                );
              }),
              const SizedBox(height: 13),
              Obx(() {
                return DropdownSearch<KabKot>(
                  dropdownDecoratorProps: DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                      labelText: "Kab/Kot",
                      hintText: "Pilih Kab/Kot",
                      filled: true,
                    ),
                  ),
                  popupProps: PopupProps.bottomSheet(
                    showSearchBox: true,
                    fit: FlexFit.loose,
                    title: const Padding(
                      padding: EdgeInsets.only(left: 8, top: 8),
                      child: Text(
                        'Cari Kabupaten/Kota',
                        style: TextStyle(color: Colors.grey, fontSize: 13),
                      ),
                    ),
                    containerBuilder: (ctx, popupWidget) {
                      return Container(color: dark2, child: popupWidget);
                    },
                  ),
                  items: alamatController.kabkots.toList(),
                  itemAsString: (KabKot kabkot) => kabkot.name,
                  onChanged: (KabKot? kabkot) {
                    alamatController.changeSelectKabKot(kabkot!.id);
                  },
                );
              }),
              const SizedBox(height: 13),
              Obx(() {
                return DropdownSearch<Kacamatan>(
                  dropdownDecoratorProps: DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                      labelText: "Kecamatan",
                      hintText: "Pilih Kecamatan",
                      filled: true,
                    ),
                  ),
                  popupProps: PopupProps.bottomSheet(
                    showSearchBox: true,
                    fit: FlexFit.loose,
                    title: const Padding(
                      padding: EdgeInsets.only(left: 8, top: 8),
                      child: Text(
                        'Cari Kecamatan',
                        style: TextStyle(color: Colors.grey, fontSize: 13),
                      ),
                    ),
                    containerBuilder: (ctx, popupWidget) {
                      return Container(color: dark2, child: popupWidget);
                    },
                  ),
                  items: alamatController.kecamatans.toList(),
                  itemAsString: (Kacamatan kecamatan) => kecamatan.name,
                  onChanged: (Kacamatan? kecamatan) {
                    alamatController.changeSelectKecamatan(kecamatan!.id);
                  },
                );
              }),
              const SizedBox(height: 13),
              Obx(() {
                return DropdownSearch<KelurahanModel>(
                  dropdownDecoratorProps: DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                      labelText: "Kelurahan",
                      hintText: "Pilih Kelurahan",
                      filled: true,
                    ),
                  ),
                  popupProps: PopupProps.bottomSheet(
                    showSearchBox: true,
                    fit: FlexFit.loose,
                    title: const Padding(
                      padding: EdgeInsets.only(left: 8, top: 8),
                      child: Text(
                        'Cari Kelurahan',
                        style: TextStyle(color: Colors.grey, fontSize: 13),
                      ),
                    ),
                    containerBuilder: (ctx, popupWidget) {
                      return Container(color: dark2, child: popupWidget);
                    },
                  ),
                  items: alamatController.kelurahans.toList(),
                  itemAsString: (KelurahanModel kelurahan) => kelurahan.name,
                  onChanged: (KelurahanModel? kelurahan) {
                    alamatController.changeSelectKelurahan(kelurahan!.id);
                  },
                );
              }),
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
                  style: GoogleFonts.montserrat(color: Colors.white),
                ),
              ),

              const SizedBox(height: 10),
              TextFormField(
                controller: kodepos,
                decoration: InputDecoration(
                  label: const Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Text('Kode POS', style: TextStyle(fontSize: 14)),
                  ),
                  fillColor: primary,
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: detailAlamat,
                maxLines: 3,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10),
                  label: const Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Text(
                      'Detail Alamat',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  fillColor: primary,
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: catatan,
                decoration: InputDecoration(
                  hintText: 'Catatan (Opsional)',
                  label: const Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Text('Catatan', style: TextStyle(fontSize: 14)),
                  ),
                  fillColor: primary,
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
                    alamatController.createAlamat(
                      labelAlamat: labelAlamat.text,
                      idProvinsi: alamatController.selectProvinsi!,
                      idKabKot: alamatController.selectKabKot!,
                      idKecamatan: alamatController.selectKecamatan!,
                      idKelurahan: alamatController.selectKelurahan!,
                      detailAlamat: detailAlamat.text,
                      nomorHp: nomorHp.text,
                      namaLengkap: namaLengkap.text,
                      jenisAlamat: alamatController.selectedJenisALamat
                          .toString(),
                      catatan: catatan.text,
                      lat: alamatController.latC.text,
                      long: alamatController.longC.text,
                      kodepos: kodepos.text,
                      jenisKelamin: '',
                    );
                  },
                  child: Text(
                    'Simpan',
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
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
