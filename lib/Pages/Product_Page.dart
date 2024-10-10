import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kinds_store/Admin/colors.dart';

class ProductScreen extends StatefulWidget {
  final String image, name, detail, price;

  ProductScreen(
      {required this.image,
      required this.name,
      required this.detail,
      required this.price});

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
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                widget.image,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 25),

            // Product Name, Price, and Ratings
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Text(
                      widget.price + " Espees",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Row(
                      children: [
                        Icon(
                          Iconsax.star1,
                          size: 20,
                          color: Colors.yellow[800],
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          "5.0",
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          "(312 Reviews)",
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                const Icon(Iconsax.heart, color: Colors.grey)
              ],
            ),
            const SizedBox(height: 15),

            // Color Options
            const Text(
              "Color",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                _buildColorCircle(Colors.black),
                _buildColorCircle(Colors.blue[900]!),
                _buildColorCircle(Colors.purple[900]!),
                _buildColorCircle(Colors.deepOrange),
              ],
            ),
            const SizedBox(height: 20),

            // Tabs: Details, Price, Delivery
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildTabButton("Details", isSelected: true),
                  _buildTabButton("Price in local currency", isSelected: false),
                  _buildTabButton("Delivery & Returns", isSelected: false),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Product Detail Section
            Text(
              widget.detail,
              style: TextStyle(fontSize: 14),
            ),

            const SizedBox(height: 50), // Space before add to cart button
          ],
        ),
      ),

      // Add to Cart Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ElevatedButton(
          onPressed: () {
            // Add to cart functionality
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            padding: const EdgeInsets.symmetric(vertical: 15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              SizedBox(width: 10),
              Text(
                "Add to Cart",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper function to build color options
  Widget _buildColorCircle(Color color) {
    return Container(
      height: 30,
      width: 30,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(50),
      ),
    );
  }

  // Helper function to build tab buttons
  Widget _buildTabButton(String text, {required bool isSelected}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.lightBlue),
        color: isSelected ? Colors.lightBlueAccent.shade100 : Colors.grey[300],
        borderRadius: BorderRadius.circular(25),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }
}
