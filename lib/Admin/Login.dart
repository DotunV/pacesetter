import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kinds_store/Admin/add_product.dart';
import 'package:kinds_store/Admin/colors.dart';

class AdminLoginScreen extends StatefulWidget {
  const AdminLoginScreen({super.key});

  @override
  State<AdminLoginScreen> createState() => _AdminLoginScreenState();
}

class _AdminLoginScreenState extends State<AdminLoginScreen> {
  TextEditingController usernamecontroller = new TextEditingController();
  TextEditingController passwordcontroller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
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
                SizedBox(height: 50,),
                Image.asset("assets/images/logo1.png"),
                const SizedBox(height: 25),
                const Text(
                  "Admin Login",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const SizedBox(height: 25),
                TextFormField(
                  controller: usernamecontroller,
                  decoration: const InputDecoration(
                    labelText: 'User Name',
                    prefixIcon: Icon(
                      Icons.mail,
                      color: Colors.grey,
                      size: 18,
                    ),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your user name';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: passwordcontroller,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.grey,
                      size: 18,
                    ),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'The password is empty';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 19,
                ),
                Center(
                  child: InkWell(
                    onTap: () {
                      loginAdmin();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(9)),
                      child: Text(
                        "Login to Admin Dashboard",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  loginAdmin() {
    FirebaseFirestore.instance.collection("Admin").get().then((snapshot) {
      snapshot.docs.forEach((result) {
        if (result.data()['username'] == usernamecontroller.text.trim()) {
          if (result.data()['password'] != passwordcontroller.text.trim()) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              backgroundColor: Colors.orange,
              content: Text("Password is incorrect"),
            ));
          } else {
            // Password is correct, navigate to AdminHomePage
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddProductPage()));
          }
        }
      });

      // If user not found, show username error
      // if () {
      //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      //     backgroundColor: Colors.orange,
      //     content: Text("Your ID is incorrect"),
      //   ));
      // }
    });
  }

  // loginAdmin(){
  //   FirebaseFirestore.instance.collection("Admin").get().then((snapshot)){
  //     snapshot.docs.forEach((result) {
  //       if(result.data()['username']!=usernamecontroller.text.trim()){
  //         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //           backgroundColor: Colors.orange,
  //           content: Text("Your id is incorrect")));
  //       }
  //       else if(result.data()['password']!=passwordcontroller.text.trim()){
  //         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //           backgroundColor: Colors.orange,
  //           content: Text("Password is incorrect")));
  //       }
  //       else{
  //         Navigator.push(context, MaterialPageRoute(builder: (context) => AdminHomePage()));
  //       }
  //     });
  //   };
  // }
}
