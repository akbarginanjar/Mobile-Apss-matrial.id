import 'package:mobile_balanja_id/balanja_app/global_resource.dart';

class Carousel extends StatefulWidget {
  final List<String> listImage;
  final bool isLoad;
  const Carousel({super.key, required this.listImage, this.isLoad = false});

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: widget.listImage.map((item) {
            return SizedBox(
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
            height: 153,
            enlargeCenterPage: false,
            autoPlay: true,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastEaseInToSlowEaseOut,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
        ),
        const SizedBox(height: 8.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.listImage.asMap().entries.map((entry) {
            final int index = entry.key;
            final bool isSelected = _current == index;

            return GestureDetector(
              onTap: () => {}, 
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut,
                width: isSelected ? 20.0 : 8.0, 
                height: 8.0,
                margin: const EdgeInsets.symmetric(horizontal: 3.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0), 
                  color: isSelected 
                      ? primary
                      : textdark,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}