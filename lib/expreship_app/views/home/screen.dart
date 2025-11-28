import 'package:mobile_balanja_id/expreship_app/controllers/home_controller.dart';
import 'package:mobile_balanja_id/expreship_app/global_resources.dart';
// import 'package:mapbox_gl/mapbox_gl.dart';

class HomeScreenExpreship extends StatelessWidget {
  const HomeScreenExpreship({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        surfaceTintColor: white,
        elevation: 5,
        shadowColor: Colors.grey[100],
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${box.read('nama_lengkap')}',
              style: const TextStyle(fontSize: 16),
            ),
            // const Text(
            //   'Driver',
            //   style: TextStyle(fontSize: 11, fontWeight: FontWeight.normal),
            // ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications_outlined,
                color: primary,
                size: 28,
              ),
            ),
          ),
        ],
      ),
      // -6.962973795377974, 107.6105835810998
      body: Obx(() {
        if (controller.longitude.value == 0.0 ||
            controller.latitude.value == 0.0) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return Stack(
            children: [
              Positioned(
                left: 20,
                right: 20,
                bottom: 20,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 20,
                  shadowColor: Colors.grey[400],
                  surfaceTintColor: white,
                  margin: const EdgeInsets.all(0),
                  color: white,
                  child: const MenuComponent(),
                ),
              ),
            ],
          );
        }
      }),
    );
  }
}
