import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {
  // List of categories
  final List<Map<String, String>> categoriez = [
    {'title': 'Food Stuff', 'image': 'assets/images/food1.jpeg'},
    {'title': 'Fashion', 'image': 'assets/images/fashion1.jpeg'},
    {'title': 'Computer & Accessories', 'image': 'assets/images/computer1.jpeg'},
    {'title': 'Furniture', 'image': 'assets/images/furniture1.jpeg'},
    {'title': 'Grocery', 'image': 'assets/images/gros1.jpeg'},
    {'title': 'Home & Kitchen', 'image': 'assets/images/home1.jpeg'},
    {'title': 'Jewelry', 'image': 'assets/images/jewelry1.jpeg'},
    {'title': 'Beauty & Personal Care', 'image': 'assets/images/beauty1.jpeg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'All Categories',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          // Optionally add icons for settings or notifications
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: Colors.white70,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        child: ListView.separated(
          itemCount: categoriez.length,
          separatorBuilder: (context, index) => SizedBox(height: 15),
          itemBuilder: (context, index) {
            return CategoryCard(
              title: categoriez[index]['title']!,
              imageUrl: categoriez[index]['image']!,
            );
          },
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String title;
  final String imageUrl;

  CategoryCard({required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(imageUrl),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}


