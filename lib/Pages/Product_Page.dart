import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

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
              child: Image.asset(
                "assets/images/product1.jpeg",
                fit: BoxFit.contain,
              ),
            ),
            const Text(
              "White Nike Sneakers",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Text(
              "8 Espees",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Icon(
                  Iconsax.star1,
                  size: 20,
                  color: Colors.yellow[800],
                ),
                SizedBox(
                  width: 8,
                ),
                const Text(
                  "5.0",
                  style: TextStyle(fontWeight: FontWeight.normal),
                ),
                SizedBox(
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
      ),
    );
  }
}
