import 'package:mobile_balanja_id/balanja_app/global_resource.dart';

class LoadingProses extends StatelessWidget {
  const LoadingProses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        color: Colors.white,
        surfaceTintColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SizedBox(
            height: 25,
            width: 25,
            child: CircularProgressIndicator(
              strokeWidth: 3,
              valueColor: AlwaysStoppedAnimation(primary),
            ),
          ),
        ),
      ),
    );
  }
}
