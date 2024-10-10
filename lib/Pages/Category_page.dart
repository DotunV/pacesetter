import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kinds_store/Components/colors.dart';
import 'package:kinds_store/Pages/Product_Page.dart';
import 'package:kinds_store/Services/database.dart';
import 'package:kinds_store/Utiliis/box_shadow.dart';

class CategoryScreen extends StatefulWidget {
  String category;
  CategoryScreen({required this.category});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  Stream? CategoryStream;

  getontheload() async {
    try {
      CategoryStream = await DatabaseMethods().getProducts(widget.category);
      setState(() {});
    } catch (e) {
      print("Error loading products: $e");
    }
  }

  @override
  void initState() {
    getontheload();
    super.initState();
  }

  Widget allProduct() {
    return StreamBuilder(
        stream: CategoryStream,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data.docs.isEmpty) {
            return Center(child: Text("No products found."));
          } else {
            return GridView.builder(
                padding: EdgeInsets.zero,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.6,
                  crossAxisSpacing: 10.0,
                ),
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot ds = snapshot.data.docs[index];

                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductScreen(
                                    detail: ds["Detail"],
                                    image: ds["Image"],
                                    name: ds["Name"],
                                    price: ds["Price"],
                                  )));
                    },
                    child: Container(
                      height: 29,
                      width: MediaQuery.of(context).size.width ,
                      padding: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [shadowStyle.shadowOFProductCard],
                          borderRadius: BorderRadius.circular(16)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10,),
                          
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25)),
                            // height: 180,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.network(ds["Image"],
                                    fit: BoxFit.cover)),
                          ),
                          Text(
                            ds["Name"],
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            ds["Price"] + "Espees",
                            style: TextStyle(fontWeight: FontWeight.normal),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Iconsax.star1,
                                size: 20,
                                color: Colors.yellow[800],
                              ),
                              const Text(
                                "5.0",
                                style: TextStyle(fontWeight: FontWeight.normal),
                              ),
                              const Text(
                                "(312 Reviews)",
                                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 3, horizontal: 6),
                            decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(6)),
                            child: const Center(
                                child: Text(
                              "Veiw Product",
                              style: TextStyle(color: Colors.white),
                            )),
                          )
                        ],
                      ),
                    ),
                  );
                });
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white70,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            children: [
               Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back))
                ],
              ),
              SizedBox(height: 20,),
              Expanded(child: allProduct()),
            ],
          ),
        ),
      ),
    );
  }
}
