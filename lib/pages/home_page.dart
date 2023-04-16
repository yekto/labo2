import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:labo2/pages/shop_page.dart';
import 'package:labo2/widget/bottomnavbar.dart';
import 'package:labo2/widget/mycolor.dart';
import 'cart_page.dart';
import 'exit_page.dart';
import 'login_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final user = FirebaseAuth.instance.currentUser!;
  // void signUserOut() {
  //   FirebaseAuth.instance.signOut();
  // }

  int _selectedIndex = 0;
  void navigateBottomBar(int newIndex){
    setState(() {
      _selectedIndex = newIndex;
    });
  }

  final List<Widget> _pages = [
    //Shop page
    ShopPage(),

    //Chart page
    CartPage(),

    //logout page
    ExitPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyBottomNavBar(onTabChange:(index) => navigateBottomBar(index),),
      backgroundColor: MyColor.mainGrey,
      body: _pages[_selectedIndex],
    );

    //Batas Scaffold-----------------------------------------------
    //   Scaffold(
    //   appBar: AppBar(
    //     backgroundColor: Colors.black,
    //     actions: [
    //       IconButton(
    //         onPressed: signUserOut,
    //         icon: Icon(Icons.logout),
    //       ),
    //     ],
    //   ),
    //   body: Container(
    //     child: Center(
    //       child: Column(
    //         // mainAxisAlignment: MainAxisAlignment.center,
    //         // children: [
    //         //   Text("Loged in as " + user.email!),Text("logeddddd in as ${user.phoneNumber}"), Text("User is"+ user.uid)//PNj52
    //         // ],
    //       ),
    //     ),
    //   ),
    //   bottomNavigationBar: MyBottomNavBar(),
    // );
    //Sampai sini------------------------------------------------------
  }
}
