import 'package:mobile_balanja_id/balanja_app/config/theme.dart';
import 'package:mobile_balanja_id/balanja_app/controllers/detail_produk_controller.dart';
import 'package:mobile_balanja_id/balanja_app/global_resource.dart';

class TokoInfo extends StatelessWidget {
  final Produk? produk;
  const TokoInfo({super.key, this.produk});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DetailProdukController());
    return Container(
      color: dark,
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 11.0),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(
                    'assets/icon-kecil-matrial.png',
                    fit: BoxFit.cover,
                    width: 40,
                  ),
                ),
              ),
              Flexible(
                flex: 3,
                child: Container(
                  margin: const EdgeInsets.only(left: 3.0, right: 2.0),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        produk!.varianBarang[0].gudang!.member!.namaLengkap
                            .toString(),
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: textTheme,
                          fontSize: 17,
                        ),
                      ),
                      Text(
                        produk!.varianBarang[0].gudang!.alamat ?? '-',
                        maxLines: 1,
                        softWrap: true,
                        style: Theme.of(context).textTheme.bodyMedium?.apply(),
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Rating',
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        softWrap: true,
                        style: Theme.of(context).textTheme.bodySmall?.apply(),
                      ),
                      SizedBox(height: 2),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.orangeAccent),
                          SizedBox(width: 5),
                          Text(
                            '${produk!.varianBarang[0].gudang!.rating!.rating}',
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            softWrap: true,
                            style: Theme.of(
                              context,
                            ).textTheme.titleLarge?.apply(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Column(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     Row(
              //       mainAxisAlignment: MainAxisAlignment.start,
              //       crossAxisAlignment: CrossAxisAlignment.end,
              //       children: [
              //         Text(
              //           '130+ ',
              //           maxLines: 1,
              //           softWrap: true,
              //           style: Theme.of(context).textTheme.bodyMedium?.apply(
              //             color: Theme.of(context).colorScheme.primary,
              //           ),
              //         ),
              //         Text(
              //           'Produk',
              //           maxLines: 1,
              //           softWrap: true,
              //           style: Theme.of(
              //             context,
              //           ).textTheme.bodyMedium?.apply(color: textdark),
              //         ),
              //       ],
              //     ),
              //   ],
              // ),
              SizedBox.shrink(),
              Obx(
                () => TextButton(
                  onPressed: controller.isLoadingFollowingToko.value
                      ? null
                      : () {
                          if (controller.isFollowingToko.value) {
                            // kalau sudah mengikuti → dialog
                            showUnfollowDialog(
                              onConfirm: () {
                                controller.toggleFollow(
                                  tokoId:
                                      produk!.varianBarang[0].gudang!.memberId!,
                                  memberId: GetStorage().read('member_id'),
                                );
                              },
                            );
                          } else {
                            // kalau belum mengikuti → langsung follow
                            controller.toggleFollow(
                              tokoId: produk!.varianBarang[0].gudang!.memberId!,
                              memberId: GetStorage().read('member_id'),
                            );
                          }
                        },
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    backgroundColor: Theme.of(
                      context,
                    ).colorScheme.primary.withOpacity(0.2),
                  ),
                  child: controller.isLoadingFollowingToko.value
                      ? const SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : Text(
                          controller.isFollowingToko.value
                              ? 'Mengikuti'
                              : 'Ikuti Toko',
                          style: Theme.of(context).textTheme.bodyLarge!.apply(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
