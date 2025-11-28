import 'package:mobile_balanja_id/balanja_app/global_resource.dart';

class BannerPromo extends StatelessWidget {
  final String urlImage;
  final VoidCallback? onPress;
  const BannerPromo({super.key, required this.urlImage, this.onPress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: InkWell(
        onTap: () => onPress?.call(),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(14.0),
          child: Image.network(
            urlImage,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 5.2,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
