import 'package:flutter/material.dart';
import 'package:mobile_balanja_id/balanja_app/global_resource.dart';

class DescripsiCart extends StatelessWidget {
  const DescripsiCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("item pertama", style: TextStyle(fontSize: 20, color: textdark)),
            Text("deskripsi", style: TextStyle(color: textdark),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("\$ 33.0", style: TextStyle(color: primary),),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Container(
                    padding: const EdgeInsets.only(
                      top: 10,
                      bottom: 10,
                      left: 10,
                      right: 10,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: dark,
                    ),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            // popularProduct.setQuantity(false);
                          },
                          child: SizedBox(
                            width: 20,
                            height: 20,
                            child: Icon(
                              Icons.remove,
                              color: primary,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text("0", style: TextStyle(color: primary),),
                        const SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            // popularProduct.setQuantity(true);
                          },
                          child: SizedBox(
                            width: 20,
                            height: 20,
                            child: Icon(
                              Icons.add,
                              color: primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
