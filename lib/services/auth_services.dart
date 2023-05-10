import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthServices {
  signInWithGoogle() async {
    //interactive sign in process
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    //dapat auth dri request
    final GoogleSignInAuthentication gAuth =  await gUser!.authentication;

    //create new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}