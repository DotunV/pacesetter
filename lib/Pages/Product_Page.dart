import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kinds_store/Components/colors.dart';

class ProductScreen extends StatefulWidget {
  String image, name, detail, price;
  ProductScreen({super.key, required this.image, required this.name, required this.detail, required this.price});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Product Details",
          style: TextStyle(fontSize: 16),
        ),
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back)),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                widget.image ,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(
                     widget.name ,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                     Text(
                       "${widget.price}Espees",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Icon(
                          Iconsax.star1,
                          size: 20,
                          color: Colors.yellow[800],
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        const Text(
                          "5.0",
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        const Text(
                          "(312 Reviews)",
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                const Icon(Iconsax.heart)
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Color",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Container(
                  height: 30,
                  width: 30,
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(50)),
                ),
                Container(
                  height: 30,
                  width: 30,
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                      color: Colors.blue[900],
                      borderRadius: BorderRadius.circular(50)),
                ),
                Container(
                  height: 30,
                  width: 30,
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                      color: Colors.purple[900],
                      borderRadius: BorderRadius.circular(50)),
                ),
                Container(
                  height: 30,
                  width: 30,
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(50)),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.lightBlue),
                  color: Colors.lightBlueAccent.shade100,
                  borderRadius: BorderRadius.circular(25)),
              child: const Text("Details", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),),
            )
          ],
        ),
      ),
    );
  }
}
