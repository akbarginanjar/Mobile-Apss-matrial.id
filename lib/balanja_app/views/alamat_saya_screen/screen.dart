import 'package:mobile_balanja_id/balanja_app/global_resource.dart';
import 'package:mobile_balanja_id/balanja_app/models/alamat_model.dart';
import 'package:mobile_balanja_id/balanja_app/controllers/alamat_controller.dart';
import 'package:mobile_balanja_id/balanja_app/views/alamat_saya_screen/form/edit_alamat.dart';
import 'package:mobile_balanja_id/balanja_app/views/alamat_screen/screen.dart';
class AlamatSayaScreen extends StatelessWidget {
  final controller = Get.put(AlamatController());

  AlamatSayaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    controller.fetchAlamatList(GetStorage().read('member_id'));

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: primary),
        title: const Text("Alamat Saya"),
        actions: [
          TextButton(
            onPressed: () async {
              final result = await Get.to(() => AlamatScreen());
              if (result == 'success') {
                controller.fetchAlamatList(GetStorage().read('member_id'));
              }
            },
            child: Text(
              "+ Tambah Baru",
              style: TextStyle(color: primary),
            ),
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoadingAlamat.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.alamatList.isEmpty) {
          return const Center(child: Text("Belum ada alamat"));
        }
        return ListView.builder(
          itemCount: controller.alamatList.length,
          itemBuilder: (context, index) {
            final Alamat item = controller.alamatList[index];
            return Card(
              margin: const EdgeInsets.all(8),
              color: dark,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.labelAlamat ?? ''
                    ),
                    Text(
                      item.namaKontak ?? '',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Kontak: ${item.nomorKontak ?? '-'}"),
                              Text("Label: ${item.labelAlamat ?? '-'}"),
                              Text("Catatan: ${item.catatan ?? '-'}"),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadiusGeometry.circular(10)
                                )
                              ),
                              onPressed: () async {
                                final result = await Get.to(() => EditAlamatScreen(alamat: item));
                                if (result == 'success') {
                                  controller.fetchAlamatList(GetStorage().read('member_id'));
                                }
                              },
                              child: const Text("Edit"),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadiusGeometry.circular(10)
                                )
                              ),
                              onPressed: () {
                                if (item.id != null) {
                                  controller.deleteAlamat(item.id!);
                                }
                              },
                              child: const Text("Hapus"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}