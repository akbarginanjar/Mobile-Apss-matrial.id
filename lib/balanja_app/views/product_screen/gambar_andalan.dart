import 'package:mobile_balanja_id/balanja_app/global_resource.dart';

class GambarAndalan extends StatefulWidget {
  final Produk? produk;
  final bool isLoad;
  const GambarAndalan({super.key, this.produk, this.isLoad = false});

  @override
  State<GambarAndalan> createState() => _GambarAndalanState();
}

class _GambarAndalanState extends State<GambarAndalan> {
  @override
  Widget build(BuildContext context) {
    // final VarianController c = Get.find();
    return CarouselSlider.builder(
      itemCount: widget.produk!.varianBarang!.length,
      itemBuilder: (BuildContext context, int index, int realIndex) {
        return Image.network(
          '${widget.produk!.varianBarang![index].barang!.photo![0].path}',
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width,
        );
      },
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height / 2.3,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        enlargeCenterPage: false,
        viewportFraction: 1.0,
        initialPage: 0,
        onPageChanged: (index, reason) {
          // print('tes ${c.select}');
          // setState(() {
          //   c.currentIndex = index;
          // });
        },
      ),
    );
    // return CarouselSlider(
    //   options: CarouselOptions(
    //     height: MediaQuery.of(context).size.height / 2.3,
    //     autoPlay: true,
    //     autoPlayInterval: const Duration(seconds: 3),
    //     autoPlayAnimationDuration: const Duration(milliseconds: 800),
    //     enlargeCenterPage: false,
    //     viewportFraction: 1.0,
    //     initialPage: 0,
    //     onPageChanged: (index, reason) {
    //       // setState(() {
    //       //   c.select;
    //       // });
    //     },
    //   ),
    //   items: widget.listImage.map((val) {
    //     return Image.network(
    //       val,
    //       fit: BoxFit.cover,
    //       width: MediaQuery.of(context).size.width,
    //     );
    //   }).toList(),
    // );
  }
}
