import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kinds_store/Pages/category_page.dart';
import 'package:kinds_store/widgets/cards/product_card.dart';
import 'package:kinds_store/widgets/carousel_banner.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    String name;

    List categories = [
      'Food',
      'Fashion',
      'Grocery',
      'Electronics',
    ];

    List Categoryname = [
      'Food',
      'Fashion',
      'Grocery',
      'Electronics',
    ];
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // notification icon
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [Icon(Iconsax.notification)],
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  // greetings
                  const Text(
                    "Welcome",
                    style: TextStyle(fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  // search box and filter btn
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 1.5,
                        padding: const EdgeInsets.all(13),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(9),
                        ),
                        child: const Row(
                          children: [
                            Icon(
                              Iconsax.search_normal,
                              color: Colors.grey,
                            ),
                            SizedBox(width: 5),
                            Text(
                              "Search",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 16),
                            )
                          ],
                        ),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.all(13),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.tune,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),

                  const SizedBox(
                    height: 25,
                  ),

                  // slider carousel
                  const CarouselBanner(),

                  const SizedBox(
                    height: 25,
                  ),

                  // categories section

                  Row(
                    children: [
                      const Text(
                        "Categories",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      Text("See all",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.blue[800],
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 35,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: categories.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return CategoryBtn(
                            title: categories[index],
                            name: Categoryname[index],
                          );
                        }),
                  ),
                  const SizedBox(
                    height: 25,
                  ),

                  const Text(
                    "Trending Products",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 15,
                  ),

                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ProductCards(),
                      ProductCards(),
                    ],
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ProductCards(),
                      ProductCards(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

class CategoryBtn extends StatelessWidget {
  String title, name;
  CategoryBtn({super.key, required this.title, required this.name});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CategoryScreen(category: name)));
      },
      child: Container(
        margin: const EdgeInsets.only(right: 20),
        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            color: Colors.grey.shade200),
        child: Text(title,
            style: TextStyle(
                color: Colors.grey.shade600, fontWeight: FontWeight.w500)),
      ),
    );
  }
}
