import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:labo2/widget/mybutton.dart';
import 'package:labo2/widget/mytextfield.dart';
import 'package:labo2/widget/square_tile.dart';
import 'package:labo2/pages/home_page.dart';

import '../firebase_options.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;

  LoginPage({Key? key, required this.onTap}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> signUserin() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    try {
      UserCredential myUser =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      if (myUser.user?.emailVerified == true) {

        await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: emailController.text.trim(),
                password: passwordController.text.trim())
            .then((value) => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                )));
        emailController.clear();
        passwordController.clear();Navigator.pop(context);
      } else {
        Navigator.pop(context);
        showErrorMessage(
            "You need verify your email in " + emailController.text.toString());
      }
      // Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      showErrorMessage(e.code);
    }
  }

  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(
              child: Text(
            message,
            style: TextStyle(color: Colors.white),
          )),
          backgroundColor: Colors.red,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: (Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.lock,
                      size: 100,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Text(
                      "Welcome back to Topi23may",
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    MyTextField(
                        controller: emailController,
                        hintText: "Email address",
                        obscureText: false),
                    const SizedBox(
                      height: 10,
                    ),
                    MyTextField(
                        controller: passwordController,
                        hintText: "Password",
                        obscureText: true),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("Forgot password?"),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    MyButton(
                      text: "Sign In",
                      onTap: signUserin,
                    ),
                    const SizedBox(height: 25),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 0.8,
                            color: Colors.grey[400],
                          ),
                        ),
                        Text(
                          "  Sign in with  ",
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 0.8,
                            color: Colors.grey[400],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SquareTile(imagePath: "lib/images/ggle.png",),
                        const SizedBox(
                          width: 30,
                        ),
                        SquareTile(imagePath: "lib/images/inst.png")
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Not a member? ",
                          style: TextStyle(fontSize: 13),
                        ),
                        GestureDetector(
                          onTap: widget.onTap,
                          child: Text(
                            "Register Now",
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 17,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Powered by @topi23may™",
                            style: TextStyle(fontSize: 8),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            )),
          ),
        ),
      ),
    );
  }
}
