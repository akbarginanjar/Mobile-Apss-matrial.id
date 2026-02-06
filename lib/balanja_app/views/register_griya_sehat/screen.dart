import 'package:mobile_balanja_id/balanja_app/global_resource.dart';
import 'package:mobile_balanja_id/balanja_app/views/widgets/button.dart';
import 'package:mobile_balanja_id/balanja_app/controllers/griya_controller.dart';

class RegisterGriyaScreen extends StatelessWidget {
  final griyaController = Get.put(GriyaController());

  final namaC = TextEditingController();
  final deskripsiC = TextEditingController();
  final alamatC = TextEditingController();

  RegisterGriyaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daftar Griya Sehat"),
        iconTheme: IconThemeData(color: primary),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          child: ListView(
            children: [
              const SizedBox(height: 10),
              const Text(
                "Daftarkan Griya Sehat",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Nama Griya Sehat",
                style: TextStyle(fontSize: 13),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 7),
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: dark2,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextFormField(
                  controller: namaC,
                  decoration: InputDecoration(
                    hintText: "Masukan Nama Toko",
                    hintStyle: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                    prefixIcon: const Icon(Icons.store, color: Colors.grey),
                    fillColor: primary,
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 1.5,
                        color: Colors.transparent,
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 0,
                        color: Colors.transparent,
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                "Deskripsi",
                style: TextStyle(fontSize: 13),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 7),
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: dark2,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextFormField(
                  controller: deskripsiC,
                  decoration: InputDecoration(
                    hintText: "Masukan Deskripsi",
                    hintStyle: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                    prefixIcon: const Icon(Icons.notes, color: Colors.grey),
                    fillColor: primary,
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 1.5,
                        color: Colors.transparent,
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 0,
                        color: Colors.transparent,
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                "Alamat",
                style: TextStyle(fontSize: 13),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 7),
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: dark2,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextFormField(
                  controller: alamatC,
                  decoration: InputDecoration(
                    hintText: "Masukan Alamat",
                    hintStyle: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                    prefixIcon:
                        const Icon(Icons.location_on, color: Colors.grey),
                    fillColor: primary,
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 1.5,
                        color: Colors.transparent,
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 0,
                        color: Colors.transparent,
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              DefaultButton(
                text: "Daftar",
                press: () {
                  griyaController.registerGriya(
                    nama: namaC.text,
                    deskripsi: deskripsiC.text,
                    alamat: alamatC.text,
                  );
                },
                color: primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}