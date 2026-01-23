import 'package:mobile_balanja_id/balanja_app/global_resource.dart';
import 'package:mobile_balanja_id/balanja_app/views/widgets/button.dart';

class RegisterGriyaScreen extends StatelessWidget {
  const RegisterGriyaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Daftar Griya Sehat"),
        iconTheme: IconThemeData(
          color: primary
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Form(
          child: ListView(
            children: [
              const SizedBox(height: 10,),
              Text(
                "Daftarkan Griya Sehat",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 20,),
              Text(
                "Nama Griya Sehat",
                style: TextStyle(fontSize: 13),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 7),
                height: 50,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: dark2,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Masukan Nama Toko",
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                    prefixIcon: Icon(Icons.store, color: Colors.grey,),
                    fillColor: primary,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1.5,
                        color: Colors.transparent
                      ),
                      borderRadius: BorderRadius.circular(25)
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 0,
                        color: Colors.transparent
                      ),
                      borderRadius: BorderRadius.circular(25)
                    )
                  ),
                ),
              ),
              const SizedBox(height: 15,),
              Text(
                "Deskripsi", 
                style: TextStyle(fontSize: 13),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 7),
                height: 50,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: dark2,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Masukan Deskripsi",
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                    prefixIcon: Icon(Icons.notes, color: Colors.grey,),
                    fillColor: primary,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1.5,
                        color: Colors.transparent
                      ),
                      borderRadius: BorderRadius.circular(25)
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 0,
                        color: Colors.transparent
                      ),
                      borderRadius: BorderRadius.circular(25)
                    )
                  ),
                ),
              ),
              const SizedBox(height: 15,),
              Text(
                "Alamat", 
                style: TextStyle(fontSize: 13),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 7),
                height: 50,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: dark2,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Masukan Alamat",
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                    prefixIcon: Icon(Icons.location_on, color: Colors.grey,),
                    fillColor: primary,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1.5,
                        color: Colors.transparent
                      ),
                      borderRadius: BorderRadius.circular(25)
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 0,
                        color: Colors.transparent
                      ),
                      borderRadius: BorderRadius.circular(25)
                    )
                  ),
                ),
              ),
              const SizedBox(height: 15,),
              DefaultButton(
                text: "Daftar", 
                press: (){}, 
                color: primary
              ),
            ],
          )),
      ),
    );
  }
}