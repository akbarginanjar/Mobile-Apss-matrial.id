import 'package:mobile_balanja_id/balanja_app/global_resource.dart';
import 'package:mobile_balanja_id/balanja_app/views/metode_pembayaran_screen/card_transfer_bank.dart';

class MetodePembayaranScreen extends StatelessWidget {
  const MetodePembayaranScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CheckoutController controller = Get.put(CheckoutController());
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.black38,
        elevation: 3,
        centerTitle: true,
        title: Text('Metode Pembayaran'),
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
      body: Container(
        margin: const EdgeInsets.all(15),
        child: ListView(
          children: [
            // Text(
            //   'Bayar dengan GERAI RETAIL',
            //   style: Theme.of(context).textTheme.titleSmall,
            // ),
            // const SizedBox(height: 5),
            // Card(
            //   color: Colors.white,
            //   surfaceTintColor: Colors.white,
            //   elevation: 0,
            //   shape: RoundedRectangleBorder(
            //     side: BorderSide(color: Colors.grey[300]!, width: 1.2),
            //     borderRadius: BorderRadius.circular(10),
            //   ),
            //   child: ListTile(
            //     onTap: () {},
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(10),
            //     ),
            //     leading: SizedBox(
            //       height: 40,
            //       width: 40,
            //       child: Image.network(
            //         'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/ALFAMART_LOGO_BARU.png/1200px-ALFAMART_LOGO_BARU.png',
            //       ),
            //     ),
            //     title: const Text('ALFAMART'),
            //     trailing: const Icon(
            //       Icons.arrow_forward_ios_outlined,
            //       size: 15,
            //       color: Colors.grey,
            //     ),
            //   ),
            // ),
            // const SizedBox(height: 2),
            // Card(
            //   color: Colors.white,
            //   surfaceTintColor: Colors.white,
            //   elevation: 0,
            //   shape: RoundedRectangleBorder(
            //     side: BorderSide(color: Colors.grey[300]!, width: 1.2),
            //     borderRadius: BorderRadius.circular(10),
            //   ),
            //   child: ListTile(
            //     onTap: () {},
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(10),
            //     ),
            //     leading: SizedBox(
            //       height: 40,
            //       width: 40,
            //       child: Image.network(
            //         'https://assets.indomaret.co.id/images/indomaret/meta/meta_home_07122021105655.jpg',
            //       ),
            //     ),
            //     title: const Text('INDOMARET'),
            //     trailing: const Icon(
            //       Icons.arrow_forward_ios_outlined,
            //       size: 15,
            //       color: Colors.grey,
            //     ),
            //   ),
            // ),
            // const SizedBox(height: 10),
            // Text(
            //   'Virtual Account',
            //   style: Theme.of(context).textTheme.titleSmall,
            // ),
            // const SizedBox(height: 5),
            // Card(
            //   color: Colors.white,
            //   surfaceTintColor: Colors.white,
            //   elevation: 0,
            //   shape: RoundedRectangleBorder(
            //     side: BorderSide(color: Colors.grey[300]!, width: 1.2),
            //     borderRadius: BorderRadius.circular(10),
            //   ),
            //   child: ListTile(
            //     onTap: () {},
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(10),
            //     ),
            //     leading: SizedBox(
            //       height: 40,
            //       width: 40,
            //       child: Image.network(
            //         'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2e/BRI_2020.svg/2560px-BRI_2020.svg.png',
            //       ),
            //     ),
            //     title: const Text('BRI'),
            //     trailing: const Icon(
            //       Icons.arrow_forward_ios_outlined,
            //       size: 15,
            //       color: Colors.grey,
            //     ),
            //   ),
            // ),
            // const SizedBox(height: 2),
            // Card(
            //   color: Colors.white,
            //   surfaceTintColor: Colors.white,
            //   elevation: 0,
            //   shape: RoundedRectangleBorder(
            //     side: BorderSide(color: Colors.grey[300]!, width: 1.2),
            //     borderRadius: BorderRadius.circular(10),
            //   ),
            //   child: ListTile(
            //     onTap: () {},
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(10),
            //     ),
            //     leading: SizedBox(
            //       height: 40,
            //       width: 40,
            //       child: Image.network(
            //         'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/Bank_Central_Asia.svg/2560px-Bank_Central_Asia.svg.png',
            //       ),
            //     ),
            //     title: const Text('BCA'),
            //     trailing: const Icon(
            //       Icons.arrow_forward_ios_outlined,
            //       size: 15,
            //       color: Colors.grey,
            //     ),
            //   ),
            // ),
            // const SizedBox(height: 10),
            // Text(
            //   'E-Wallet',
            //   style: Theme.of(context).textTheme.titleSmall,
            // ),
            // const SizedBox(height: 5),
            // Card(
            //   color: Colors.white,
            //   surfaceTintColor: Colors.white,
            //   elevation: 0,
            //   shape: RoundedRectangleBorder(
            //     side: BorderSide(color: Colors.grey[300]!, width: 1.2),
            //     borderRadius: BorderRadius.circular(10),
            //   ),
            //   child: ListTile(
            //     onTap: () {},
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(10),
            //     ),
            //     leading: SizedBox(
            //       height: 40,
            //       width: 40,
            //       child: Image.network(
            //         'https://logos-world.net/wp-content/uploads/2023/02/Dana-Logo.png',
            //       ),
            //     ),
            //     title: const Text('DANA'),
            //     trailing: const Icon(
            //       Icons.arrow_forward_ios_outlined,
            //       size: 15,
            //       color: Colors.grey,
            //     ),
            //   ),
            // ),
            // const SizedBox(height: 10),
            Text(
              'Transfer Bank (Konfirmasi Manual)',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(height: 5),
            FutureBuilder<List<dynamic>>(
              future: BankController().getBank(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return SizedBox(
                    height: 100,
                    child: Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(primary),
                      ),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(0),
                    itemBuilder: (context, index) {
                      return CardTransferBank(bank: snapshot.data![index]);
                    },
                  );
                }
              },
            ),
            const SizedBox(height: 10),
            Text('COD', style: Theme.of(context).textTheme.titleSmall),
            const SizedBox(height: 5),
            Card(
              color: dark,
              elevation: 0,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.grey[800]!, width: 1.2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                onTap: () {
                  controller.changeSelectBank(
                    2,
                    'COD',
                    'COD (Bayar Ditempat)',
                    '',
                  );
                  Get.back();
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                leading: SizedBox(
                  height: 30,
                  width: 30,
                  child: Image.network(
                    'https://cdn-icons-png.flaticon.com/512/6192/6192245.png',
                  ),
                ),
                title: const Text(
                  'COD (Bayar Ditempat)',
                  style: TextStyle(fontSize: 13),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 15,
                  color: Colors.grey,
                ),
              ),
            ),
            // ExpansionTile(
            //   leading: Icon(Icons.attach_money),
            //   title: Text('Bank Lainnya'),
            //   children: [
            //     Text('data'),
            //   ],
            // ),
            // Divider(
            //   color: Colors.grey[200],
            //   height: 1.5,
            // ),
          ],
        ),
      ),
    );
  }
}
