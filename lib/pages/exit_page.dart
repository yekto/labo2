import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ExitPage extends StatefulWidget {
  const ExitPage({Key? key}) : super(key: key);

  @override
  State<ExitPage> createState() => _ExitPageState();
}

class _ExitPageState extends State<ExitPage> {
  final user = FirebaseAuth.instance.authStateChanges();
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("Logout di "),
            GestureDetector(
                child: Text("sini", style: TextStyle(color: Colors.blue),),
                onTap:signUserOut),
          ],
        )
      ],
    );
  }
}
