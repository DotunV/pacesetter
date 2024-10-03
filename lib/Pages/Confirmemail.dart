import 'package:flutter/material.dart';
import 'package:kinds_store/Components/colors.dart';
import 'package:kinds_store/Utiliis/Buttons.dart';

class ConfirmEmailPage extends StatefulWidget {
  const ConfirmEmailPage({super.key});

  @override
  State<ConfirmEmailPage> createState() => _ConfirmEmailPageState();
}

class _ConfirmEmailPageState extends State<ConfirmEmailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset("assets/images/logo2.png"),
              const SizedBox(height: 25),
              const Text(
                "Enter email address",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 25),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(
                    Icons.mail,
                    color: Colors.grey,
                    size: 18,
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
              CustomButton(text: "Send Code", onPressed: () {}),
              const SizedBox(
                height: 10,
              ),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Create an account?'),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Sign Up',
                    style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Or'),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'Go back to Sign In',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: primaryColor,
                          decoration: TextDecoration.underline,
                          decorationThickness: 1),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
