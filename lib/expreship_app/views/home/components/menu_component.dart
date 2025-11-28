import 'package:mobile_balanja_id/expreship_app/global_resources.dart';

class MenuComponent extends StatelessWidget {
  const MenuComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              SizedBox(
                height: 60,
                width: 60,
                child: Card(
                  color: white,
                  surfaceTintColor: white,
                  elevation: 0,
                  shadowColor: Colors.grey[100],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: BorderSide(color: Colors.grey[300]!),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(30.0),
                    onTap: () {
                      Get.to(
                        const OrderScreen(),
                        transition: Transition.downToUp,
                      );
                    },
                    child: Icon(
                      Icons.delivery_dining,
                      size: 30,
                      color: primary,
                    ),
                  ),
                ),
              ),
              Text('Pesan', style: GoogleFonts.poppins(fontSize: 10)),
            ],
          ),
          Column(
            children: [
              SizedBox(
                height: 60,
                width: 60,
                child: Card(
                  color: white,
                  surfaceTintColor: white,
                  elevation: 0,
                  shadowColor: Colors.grey[100],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: BorderSide(color: Colors.grey[300]!),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(30.0),
                    onTap: () {
                      Get.to(
                        const RiwayatScreen(),
                        transition: Transition.downToUp,
                      );
                    },
                    child: Icon(Icons.history, size: 30, color: primary),
                  ),
                ),
              ),
              Text('Riwayat', style: GoogleFonts.poppins(fontSize: 10)),
            ],
          ),
          Column(
            children: [
              SizedBox(
                height: 60,
                width: 60,
                child: Card(
                  color: white,
                  surfaceTintColor: white,
                  elevation: 0,
                  shadowColor: Colors.grey[100],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: BorderSide(color: Colors.grey[300]!),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(30.0),
                    onTap: () {
                      Get.to(
                        const SaldoScreen(),
                        transition: Transition.downToUp,
                      );
                    },
                    child: Icon(Icons.chat, size: 30, color: primary),
                  ),
                ),
              ),
              Text('Chat', style: GoogleFonts.poppins(fontSize: 10)),
            ],
          ),
          Column(
            children: [
              SizedBox(
                height: 60,
                width: 60,
                child: Card(
                  color: white,
                  surfaceTintColor: white,
                  elevation: 0,
                  shadowColor: Colors.grey[100],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: BorderSide(color: Colors.grey[300]!),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(30.0),
                    onTap: () {
                      Get.to(
                        const ProfilScreen(),
                        transition: Transition.downToUp,
                      );
                    },
                    child: Icon(Icons.person, size: 30, color: primary),
                  ),
                ),
              ),
              Text('Profil', style: GoogleFonts.poppins(fontSize: 10)),
            ],
          ),
        ],
      ),
    );
  }
}
