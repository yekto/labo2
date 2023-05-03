import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:labo2/widget/mybigtext.dart';
import 'package:labo2/widget/mycolor.dart';
import 'package:labo2/widget/mysmalltext.dart';
import 'package:labo2/pages/body_home.dart';

class MainHome extends StatefulWidget {
  MainHome({Key? key}) : super(key: key);

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  final user = FirebaseAuth.instance.currentUser!;
  // void signUserOut() {
  //   FirebaseAuth.instance.signOut();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Container(
              margin: EdgeInsets.only(top: 30, bottom: 15),
              padding: EdgeInsets.only(left: 20, right: 20),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      MyBigText(
                        text: "Jakarta",
                        color: MyColor.mainColor,
                      ),
                      Row(
                        children: [
                          MySmallText(
                            text: "Cilincing",
                            color: MyColor.mainBlackColor,
                          ),
                          Icon(Icons.arrow_drop_down),
                        ],
                      ),
                    ],
                  ),
                  Center(
                    child: Container(
                      width: 45,
                      height: 45,
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: MyColor.mainColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          BodyHome(),
          Text("Logout di Sini bang "+user.email.toString()),
          // IconButton(onPressed: signUserOut, icon: Icon(Icons.logout,color: Colors.red,),)
        ],
      ),
    );
  }
}
