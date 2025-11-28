import 'package:mobile_balanja_id/balanja_app/global_resource.dart';

class Carousel extends StatelessWidget {
  final List<String> listImage;
  final bool isLoad;
  const Carousel({super.key, required this.listImage, this.isLoad = false});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: listImage.map((item) {
        return SizedBox(
          // height: 100,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              item,
              fit: BoxFit.contain,
            ),
          ),
        );
      }).toList(),
      options: CarouselOptions(
        height:135,
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastEaseInToSlowEaseOut,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        viewportFraction: 1,
      ),
    );
  }
}
