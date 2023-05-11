import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class test extends StatefulWidget {

  test({Key? key}) : super(key: key);

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
  final user = FirebaseAuth.instance.currentUser!;
  final emailCur = FirebaseAuth.instance.currentUser!.email;

  void _sendEmail() async {
    final _user = FirebaseAuth.instance.currentUser!;
    await _user.sendEmailVerification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 30,),
            Text("TEST"),
            SizedBox(height: 30,),
            Text(user.emailVerified.toString() + ' ' + user.email.toString()),
            Text(user.isAnonymous.toString()),
            Text(user.displayName.toString()),
            Text(emailCur.toString()),
            TextField(),
            ElevatedButton(onPressed: () {
              _sendEmail();
            }, child: Text('Kirim email verifikasi'))

          ],
        ),
      ),
    );
  }
}
