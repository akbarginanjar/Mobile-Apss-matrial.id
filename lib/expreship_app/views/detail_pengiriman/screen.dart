import 'dart:io';

import 'package:mobile_balanja_id/expreship_app/global_resources.dart';

class DetailPengirimanScreen extends StatelessWidget {
  final TugasDriver? tugasDriver;
  DetailPengirimanScreen({super.key, required this.tugasDriver});

  final DetailPengirimanController controller = Get.put(
    DetailPengirimanController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        surfaceTintColor: white,
        elevation: 1,
        centerTitle: true,
        shadowColor: Colors.grey[100],
        title: const Text('Detail Pengiriman'),
      ),
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15),
            child: ListView(
              children: [
                const SizedBox(height: 10),
                Text(
                  'Nama Penerima',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  '${tugasDriver!.recipientName}',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 15),
                const TableDetailPengirimanComponent(),
                const SizedBox(height: 20),
                Center(
                  child: SizedBox(
                    height: 50,
                    width: 200,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: white,
                        surfaceTintColor: white,
                        elevation: 10,
                        shadowColor: const Color.fromARGB(192, 245, 245, 245),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13),
                        ),
                      ),
                      onPressed: () {
                        controller.openCamera();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.camera_alt, color: primary),
                          const SizedBox(width: 10),
                          Text(
                            'Buka Kamera',
                            style: Theme.of(
                              context,
                            ).textTheme.titleSmall!.copyWith(color: primary),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: Obx(() {
                    final imagePath = controller.imagePath.value;
                    return imagePath.isNotEmpty
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(13),
                            child: Image.file(File(imagePath)),
                          )
                        : Container();
                  }),
                ),
                const SizedBox(height: 70),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: SizedBox(
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primary2,
                    surfaceTintColor: primary2,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Selesaikan Pengiriman',
                    style: Theme.of(
                      context,
                    ).textTheme.titleSmall!.copyWith(color: white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
