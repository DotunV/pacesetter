import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kinds_store/Pages/Signin.dart';

class ProfilePage extends StatefulWidget {
  
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {



  
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back, color: Colors.black),
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        // ),
      ),
      backgroundColor: Colors.white70,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            // Profile Image and Name
            CircleAvatar(
              radius: 60,
              // backgroundImage: AssetImage('assets/images/profile_pic.png'),
            ),
            SizedBox(height: 10),
            Text(
              "Ella Jorman",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            // List of Options
            ProfileOption(
              text: 'Edit Profile',
              onTap: () {
                // Navigate to Edit Profile Screen
              },
            ),
            ProfileOption(
              text: 'Delivery Address',
              onTap: () {
                // Navigate to Delivery Address Screen
              },
            ),
            ProfileOption(
              text: 'Order Tracking',
              onTap: () {
                // Navigate to Order Tracking Screen
              },
            ),
            ProfileOption(
              text: 'Order History',
              onTap: () {
                // Navigate to Order History Screen
              },
            ),
            ProfileOption(
              text: 'Wishlist',
              onTap: () {
                // Navigate to Wishlist Screen
              },
            ),
            ProfileOption(
              text: 'Add bank details',
              onTap: () {
                // Navigate to Add Bank Details Screen
              },
            ),
            ProfileOption(
              text: 'Log Out',
              onTap: () async {
                await logout(context);
              },
            ),
          ],
        ),
      ),
    );
  }
  // Logout function
  Future<void> logout(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut(); // Firebase sign out
      // Navigate to login page or any screen after logout
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (context) => SignInPage()), // Navigate to login page
      );
    } catch (e) {
      print("Error logging out: $e");
    }
  }
}

class ProfileOption extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  ProfileOption({required this.text, required this.onTap});

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


