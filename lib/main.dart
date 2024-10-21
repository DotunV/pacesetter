import 'package:firebase_core/firebase_core.dart';
import 'package:kinds_store/Pages/Product_Page.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:kinds_store/onboarding.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  // await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      // home: ProductScreen(),
      home: const OnboardingScreen(),
      // home: BottomAppBar(),
    );
  }
}
