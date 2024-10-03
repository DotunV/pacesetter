import 'package:flutter/material.dart';
import 'package:kinds_store/Components/colors.dart';
import 'package:kinds_store/Utiliis/Buttons.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
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
                "Sign In",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
              const SizedBox(
                height: 20,
              ),
              TextFormField(
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
              ),
              const Row(
               mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Forgotten Password?",
                    style: TextStyle(
                      fontSize: 12,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.black,
                      decorationThickness: 1,
                    ),
                  ),
                ],
              ),
              const SizedBox(),
              CustomButton(text: "Sign In", onPressed: () {}),
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
                    style: TextStyle(color: primaryColor),
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
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text('Sign In with'),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    child: Image.asset("assets/images/kingsChat.png"),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
