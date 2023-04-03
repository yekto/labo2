import 'package:flutter/material.dart';
import 'package:labo2/components/mytextfield.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Icon(
                Icons.lock,
                size: 100,
              ),
              SizedBox(
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
                  controller: usernameController,
                  hintText: "Username",
                  obscureText: false),
              SizedBox(
                height: 10,
              ),
              MyTextField(
                  controller: passwordController,
                  hintText: "Password",
                  obscureText: true),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Forgot password?"),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
