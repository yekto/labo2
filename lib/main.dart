import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:labo2/models/shop.dart';
import 'package:labo2/pages/TEST.dart';
import 'package:labo2/pages/auth_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:labo2/pages/container.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   home: HomePage(),
    // );

    return ChangeNotifierProvider(
      create: (context) => BubbleTeaShop(),
      builder: (context, child) => MaterialApp(
        theme: ThemeData(primarySwatch: Colors.grey),
        home: AuthPage(),
      ),
    );
  }
}
