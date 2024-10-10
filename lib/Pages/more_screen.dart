import 'package:flutter/material.dart';
import 'package:kinds_store/BottomNavigation.dart';

class MorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'More',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back, color: Colors.black),
        //   onPressed: () {
        //     Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavBar()));
        //   },
        // ),
      ),
      backgroundColor: Colors.white70,
      body: Column(
        children: [
          SizedBox(height: 20),
          // List of Options
          MoreOption(
            text: 'Trending Products',
            onTap: () {
              // Navigate to Trending Products Screen
            },
          ),
          MoreOption(
            text: 'Categories',
            onTap: () {
              // Navigate to Categories Screen
            },
          ),
          MoreOption(
            text: 'Notifications',
            onTap: () {
              // Navigate to Notifications Screen
            },
          ),
          MoreOption(
            text: 'Customer Service',
            onTap: () {
              // Navigate to Customer Service Screen
            },
          ),
          MoreOption(
            text: 'Refer and Earn',
            onTap: () {
              // Navigate to Refer and Earn Screen
            },
          ),
        ],
      ),
    );
  }
}

class MoreOption extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  MoreOption({required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 18, horizontal: 20),
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            Icon(Icons.arrow_forward_ios, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}

