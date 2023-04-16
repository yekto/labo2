import 'package:flutter/material.dart';
import 'package:labo2/models/shop.dart';
import 'package:labo2/pages/auth_page.dart';
import 'package:labo2/pages/home_page.dart';
import 'package:labo2/pages/main_home.dart';
import 'package:labo2/pages/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   home: HomePage(),
    // );

    return ChangeNotifierProvider(
      create: (context) => BubbleTeaShop(),
      builder: (context, child) => MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
