import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:labo2/pages/home_page.dart';

import 'login_or_register_page.dart';


class AuthPage extends StatelessWidget {
  AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){
          if (snapshot.hasData && snapshot.data!.emailVerified == true){
            return HomePage();
          }
          else if (snapshot.hasData && snapshot.data!.emailVerified == false) {
            return LoginOrRegisterPage();
          }
          else {
            return LoginOrRegisterPage();
          }
        },
      ),
    );
  }
}
