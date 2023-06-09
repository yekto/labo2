import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:labo2/services/auth_services.dart';
import 'package:labo2/widget/mybutton.dart';
import 'package:labo2/widget/mytextfield.dart';
import 'package:labo2/widget/square_tile.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;

  RegisterPage({Key? key, required this.onTap}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void signUserUp() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    try {
      if (passwordController.text == confirmPasswordController.text) {
        UserCredential myUser =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );
        Navigator.pop(context);
        showSuccessMessage(
            "Success Register and you need verify on your Email");
        await myUser.user!.sendEmailVerification();
        myUser.user!.reload();
        emailController.clear();
        passwordController.clear();
        confirmPasswordController.clear();
        return null;
      } else {
        Navigator.pop(context);
        showErrorMessage('Password not match');
        return null;
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

  void showSuccessMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(
              child: Text(
            message,
            style: TextStyle(color: Colors.white),
          )),
          backgroundColor: Colors.green,
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
                      size: 75,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      "Let's create an Account for you",
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
                    MyTextField(
                        controller: confirmPasswordController,
                        hintText: "Confirm Password",
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
                      text: "Sign Up",
                      onTap: signUserUp,
                    ),
                    const SizedBox(height: 17),
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
                      height: 17,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SquareTile(
                          imagePath: "lib/images/ggle.png",
                          onTap: () => AuthServices().signInWithGoogle(),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        SquareTile(
                          imagePath: "lib/images/inst.png",
                          onTap: () {},
                        )
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account? ",
                          style: TextStyle(fontSize: 13),
                        ),
                        GestureDetector(
                          onTap: widget.onTap,
                          child: Text(
                            "Login Now",
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
