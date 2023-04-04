import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:labo2/components/mybutton.dart';
import 'package:labo2/components/mytextfield.dart';
import 'package:labo2/components/square_tile.dart';
import 'package:labo2/pages/auth_page.dart';
import 'package:labo2/pages/home_page.dart';
import 'package:labo2/pages/hometest.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signUserin() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (e.code == 'user-not-found') {
        print("Wrong email");
        wrongEmailMessage();
      } else if (e.code == 'wrong-password') {
        print("Wrong password");
        wrongPasswordMessage();
      }
    }
  }

  void wrongEmailMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Center(
              child: Text(
            'Incorrect email',
            style: TextStyle(color: Colors.white),
          )),
          backgroundColor: Colors.red,
        );
      },
    );
  }

  void wrongPasswordMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Center(
              child: Text(
            'Incorrect passsword',
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
                          "  You can follow us  ",
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
                        SquareTile(imagePath: "lib/images/ggle.png"),
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
                        Text("Not a member?"),
                        TextButton(
                          onPressed: () {},
                          child: Text("Register Now"),
                        ),
                        SizedBox(width: 12,),
                        GestureDetector(
                          onTap: (){Navigator.push(context,MaterialPageRoute(builder: (context)=> HomeTest()));
                          },
                          child: Text("REG"),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Powered by @topi23may™",
                            style: TextStyle(fontSize: 8),
                          )
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
