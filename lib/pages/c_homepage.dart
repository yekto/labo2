import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:labo2/widget/mytextfield.dart';

import 'auth_page.dart';

class cHomePage extends StatefulWidget {
  const cHomePage({Key? key}) : super(key: key);

  @override
  State<cHomePage> createState() => _cHomePageState();
}

class _cHomePageState extends State<cHomePage> {
  final textController = TextEditingController();

  final currentUser = FirebaseAuth.instance.currentUser!;

  void signUserOut() {
    FirebaseAuth.instance.signOut().then((value) => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => AuthPage(),
        )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Wall Chat",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: signUserOut,
            icon: const Icon(Icons.logout, color: Colors.white),
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: MyTextField(
                      controller: textController,
                      hintText: "Write a message...",
                      obscureText: false),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.arrow_forward),
                )
              ],
            ),
            Text("Sign in as" + currentUser.email!)
          ],
        ),
      ),
    );
  }
}
