import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:labo2/components/mycolor.dart';
import 'login_page.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final user = FirebaseAuth.instance.currentUser!;

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColor.mainColor,
        actions: [
          IconButton(
            onPressed: signUserOut,
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Container(
        // color: MyColor.mainColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Loged in as " + user.email!),Text("logeddddd in as ${user.phoneNumber}"), Text("User is"+ user.uid)//PNj52
            ],
          ),
        ),
      ),
    );
  }
}
